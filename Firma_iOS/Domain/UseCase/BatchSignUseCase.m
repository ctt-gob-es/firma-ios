#import "BatchSignUseCase.h"
#import "CADESConstants.h"
#import "InputParametersBatch.h"
#import "BachRestIOS.h"
#import "ServletRest.h"
#import "Base64Utils.h"
#import "CADESSignUtils.h"
#import "Pkcs1Utils.h"
#import "IOSPrimitiveArray.h"
#import "GlobalConstants.h"

@interface BatchSignUseCase ()

@property (strong, nonatomic) InputParametersBatch *parametersBatch;
@property (strong, nonatomic) NSString *urlSafeCertificateData;
@property (weak, nonatomic) id<BatchSignUseCaseDelegate> delegate;
@property (strong, nonatomic) BachRest* bachRest;
@property (strong, nonatomic) ServletRest* servletRest;
@property (strong, nonatomic) NSString *responseMessage;
@property (copy, nonatomic) void (^completionHandler)(NSString *responseMessage, NSError *error);

@end

@implementation BatchSignUseCase

@synthesize parametersBatch;
@synthesize urlSafeCertificateData;
@synthesize delegate;
@synthesize bachRest;
@synthesize servletRest;
@synthesize responseMessage;

SecKeyRef privateKey;

- (id)initWithCertificate:(NSString *)base64UrlSafeCertificateData privateKey:(SecKeyRef)thePrivateKey {
    if (self = [super init]) {
	   self.urlSafeCertificateData = base64UrlSafeCertificateData;
	   privateKey = thePrivateKey;
	   self.bachRest = [[BachRest alloc] initWithDelegate:self];
	   self.servletRest = [[ServletRest alloc] initWithDelegate:self];
	   return self;
    } else {
	   return nil;
    }
}

- (void)signBatch:(NSDictionary *)dataOperation completion:(void (^)(NSString * _Nullable responseMessage, NSError * _Nullable error))completion {
    self.completionHandler = completion;
    
    // Obtenemos los datos que nos llegan de la petición batch y validamos
    self.parametersBatch = [self getDataOperation:dataOperation];
    
    // Si los datos llegan a null y tenemos rtservlet y file id entonces llamamos al servidor para obtener los datos del servidor intermedio
    if (self.parametersBatch.data == NULL && self.parametersBatch.rtservlet != NULL && self.parametersBatch.fileId != NULL) {
	   [self.servletRest loadDataFromRtservlet:dataOperation[PARAMETER_NAME_FILE_ID] rtServlet:dataOperation[PARAMETER_NAME_RTSERVLET] cipherKey:dataOperation[PARAMETER_NAME_CIPHER_KEY]];
    } else {
	   [self presign];
    }
}

- (void)presign {
    NSString *errorValidation = [self validateDataOperation:self.parametersBatch];
    if (errorValidation != nil) {
	   // Establecemos el error generico y enviamos la info al servidor
	   self.responseMessage = @"batch_signs_generic_error";
	   [self.servletRest storeDataError:errorValidation stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
    } else {
	   [self.bachRest bachPresign:self.parametersBatch.batchpresignerUrl withJsonData:self.parametersBatch.data withCerts:self.urlSafeCertificateData];
    }
}

- (NSString *)updateAlgorithmRSAorECDSA:(NSString *)dataBase64 {
    NSDictionary *dataDictionary = [self parseDataBase64toDictionary:dataBase64];
    
    NSString *algorithm = dataDictionary[PARAMETER_NAME_ALGORITHM2];
    algorithm = [CADESSignUtils getModifiedAlgorithmByCertificate:privateKey alg:algorithm];
    
    NSMutableDictionary *dataModifiedDictionary = [dataDictionary mutableCopy];
    dataModifiedDictionary[PARAMETER_NAME_ALGORITHM2] = algorithm;
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataModifiedDictionary options:NSJSONWritingFragmentsAllowed error:&error];
    NSString *dataModifiedBase64 = [Base64Utils encode:jsonData urlSafe:true];
    return dataModifiedBase64;
}

- (NSString *)validateDataOperation:(InputParametersBatch *)parameterBatch {
    if (!parameterBatch.operation) {
	   return @"err-00:= No se ha indicado código de operación";
    }
    if (!parameterBatch.data) {
	   return @"err-02:= No se han proporcionado los datos de la operación";
    }
    if (!parameterBatch.stservlet) {
	   return @"err-08:= No se ha proporcionado el Servlet para la comunicación de los datos";
    }
    if (!parameterBatch.batchpresignerUrl) {
	   return @"err-08:= No se ha proporcionado URL del servicio de prefirma de lotes";
    }
    if (!parameterBatch.batchpostsignerUrl) {
	   return @"err-08:= No se ha proporcionado URL del servicio de postfirma de lotes";
    }
    NSDictionary *dict = [self parseDataBase64toDictionary:parameterBatch.data];
    if (!dict) {
	   return @"err-12:= Error en la codificación del base 64";
    } else {
	   if (!dict[@"algorithm"]) {
		  return @"err-10:= No se ha configurado un algoritmo para la firma";
	   }
    }
    return nil;
}

- (InputParametersBatch *)getDataOperation:(NSDictionary *)dataOperation {
    InputParametersBatch *parameters = [[InputParametersBatch alloc] init];
    
    if (dataOperation[PARAMETER_NAME_OPERATION]) {
	   parameters.operation = dataOperation[PARAMETER_NAME_OPERATION];
    }
    if (dataOperation[PARAMETER_NAME_ID]) {
	   parameters.identifier = dataOperation[PARAMETER_NAME_ID];
    }
    if (dataOperation[PARAMETER_NAME_CIPHER_KEY]) {
	   parameters.cipherKey = dataOperation[PARAMETER_NAME_CIPHER_KEY];
    }
    if (dataOperation[PARAMETER_NAME_STSERVLET]) {
	   parameters.stservlet = dataOperation[PARAMETER_NAME_STSERVLET];
    }
    if (dataOperation[PARAMETER_NAME_BATCH_PRESIGNER_URL]) {
	   parameters.batchpresignerUrl = dataOperation[PARAMETER_NAME_BATCH_PRESIGNER_URL];
    }
    if (dataOperation[PARAMETER_NAME_BATCH_POSTSIGNER_URL]) {
	   parameters.batchpostsignerUrl = dataOperation[PARAMETER_NAME_BATCH_POSTSIGNER_URL];
    }
    if (dataOperation[PARAMETER_NAME_PROPERTIES]) {
	   parameters.properties = dataOperation[PARAMETER_NAME_PROPERTIES];
    }
    if (dataOperation[PARAMETER_NAME_BATCH_JSON]) {
	   parameters.jsonbatch = dataOperation[PARAMETER_NAME_BATCH_JSON];
    }
    if (dataOperation[PARAMETER_NAME_DAT]) {
	   NSString *datBase64 = dataOperation[PARAMETER_NAME_DAT];
	   parameters.data = datBase64;
    }
    if (dataOperation[PARAMETER_NAME_FILE_ID]) {
	   parameters.fileId = dataOperation[PARAMETER_NAME_FILE_ID];
    }
    if (dataOperation[PARAMETER_NAME_RTSERVLET]) {
	   parameters.rtservlet = dataOperation[PARAMETER_NAME_RTSERVLET];
    }
    
    return parameters;
}

- (void)didSuccessBachPresign:(NSDictionary *)responseDict {
    NSString *dataPostSignBase64 = self.parametersBatch.data;
    NSString *algorithm = [self getAlgorithm];
    
    NSDictionary *presignsOk = responseDict[@"td"];
    if (presignsOk) {
	   for (NSDictionary *sign in presignsOk[@"signs"]) {
		  NSDictionary *singInfoDict = [sign[@"signinfo"] firstObject];
		  NSMutableDictionary *paramsDict = singInfoDict[@"params"];
		  
		  NSString *pre = paramsDict[PRE];
		  BOOL pk1Decoded = [paramsDict[PK1_DECODED] boolValue];
		  
		  NSString *pk1 = [self sign:pre withAlgorith:algorithm withPK1Decoded:pk1Decoded];
		  if ([pk1 isEqualToString:@""]) {
			 self.responseMessage = @"batch_signs_generic_error";
			 NSString *error = @"err-14:= Ocurrió un error en la operación de firma";
			 [self.servletRest storeDataError:error stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
		  }
		  paramsDict[@"PK1"] = pk1;
		  
		  NSString *needPre = paramsDict[@"NEED_PRE"];
		  if (!needPre || [needPre isEqualToString:@"false"]) {
			 [paramsDict removeObjectForKey:@"PRE"];
			 [paramsDict removeObjectForKey:@"NEED_PRE"];
		  }
	   }
	   
	   NSArray *presignsErrors = responseDict[@"results"];
	   if (presignsErrors) {
		  NSDictionary *dataOperation = [self parseDataBase64toDictionary:self.parametersBatch.data];
		  
		  for (NSDictionary *signError in presignsErrors) {
			 NSString *signId = signError[@"id"];
			 NSString *result = signError[@"result"];
			 NSString *description = signError[@"description"];
			 
			 for (NSMutableDictionary *singleSign in dataOperation[@"singlesigns"]) {
				NSString *singleSignId = singleSign[@"id"];
				if (singleSignId && [singleSignId isEqualToString:signId]) {
				    [singleSign removeObjectForKey:@"datareference"];
				    [singleSign removeObjectForKey:@"format"];
				    [singleSign removeObjectForKey:@"suboperation"];
				    [singleSign removeObjectForKey:@"extraparams"];
				    
				    singleSign[@"result"] = result;
				    singleSign[@"description"] = description;
				    break;
				}
			 }
		  }
		  
		  NSError *error;
		  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataOperation
												   options:NSJSONWritingPrettyPrinted
													error:&error];
		  if (!jsonData) {
			 self.responseMessage = @"batch_signs_generic_error";
			 NSString *error = @"err-21:= No se ha podido actualizar las firmas con el error antes de enviar al servicio de postfirma ";
			 [self.servletRest storeDataError:error stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
		  } else {
			 dataPostSignBase64 = [Base64Utils encode:jsonData urlSafe:true];
		  }
	   }
	   
	   NSError *error;
	   NSData *jsonData = [NSJSONSerialization dataWithJSONObject:presignsOk
											    options:NSJSONWritingPrettyPrinted
												 error:&error];
	   if (!jsonData) {
		  self.responseMessage = @"batch_signs_generic_error";
		  NSString *error = @"err-21:= No se ha podido generar el json para enviar al servicio de postfirma ";
		  [self.servletRest storeDataError:error stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
	   } else {
		  NSString *base64tridata = [Base64Utils encode:jsonData urlSafe:true];
		  [self.bachRest bachPostsign:self.parametersBatch.batchpostsignerUrl withJsonData:dataPostSignBase64 withCerts:self.urlSafeCertificateData withTriData:base64tridata];
	   }
    } else {
	   NSMutableDictionary *jsonErrorSigns = [[NSMutableDictionary alloc] init];
	   jsonErrorSigns[@"signs"] = responseDict[@"results"];
	   
	   NSError *error;
	   NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonErrorSigns
											    options:NSJSONWritingPrettyPrinted
												 error:&error];
	   if (!jsonData) {
		  self.responseMessage = @"batch_signs_generic_error";
		  NSString *error = @"err-21:= No se ha podido generar el json con los errores de todas las firmas";
		  [self.servletRest storeDataError:error stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
	   } else {
		  self.responseMessage = @"batch_signs_ok_with_signs_error";
		  [self.servletRest storeData:jsonData certificateBase64:nil stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
	   }
    }
}

- (NSString *)sign:(NSString *)pre withAlgorith:(NSString *)algorithm withPK1Decoded:(BOOL)pk1Decoded {
    NSData *data = [Base64Utils decode:pre urlSafe:true];
    
    if (data.length > 0) {
	   CADESSignUtils *signUtils = [[CADESSignUtils alloc] init];
	   NSData *dataSigned = [signUtils signDataWithPrivateKey:&privateKey data:data algorithm:algorithm];
	   
	   if (pk1Decoded) {
		  IOSByteArray *byteArray = [IOSByteArray arrayWithBytes:[dataSigned bytes] count:[dataSigned length]];
		  IOSByteArray *decodedSignature = EsGobAfirmaCoreSignersPkcs1Utils_decodeSignatureWithByteArray_(byteArray);
		  dataSigned = [NSData dataWithBytes:[decodedSignature buffer] length:[decodedSignature length]];
	   }
	   
	   NSString *stringSigned = [Base64Utils encode:dataSigned];
	   return stringSigned;
    } else {
	   return @"";
    }
}

- (NSDictionary *)parseDataBase64toDictionary:(NSString *)stringData {
    NSData *dataReceived = [Base64Utils decode:stringData urlSafe:true];
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataReceived
											  options:NSJSONReadingMutableContainers
											    error:&error];
    if (!dict) {
	   NSLog(@"Got an error: %@", error);
	   return nil;
    }
    return dict;
}

- (NSString *)getAlgorithm {
    NSDictionary *dict =[self parseDataBase64toDictionary: self.parametersBatch.data];
    if (dict == nil) {
	   return @"";
    } else {
	   return dict[PARAMETER_NAME_ALGORITHM2];
    }
}

- (void)didSuccessBachPostsign:(NSDictionary *)responseDict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseDict
											options:NSJSONWritingPrettyPrinted
											  error:&error];
    if (!jsonData) {
	   self.responseMessage = @"batch_signs_generic_error";
	   NSString *errorToSend = @"err-07:= Los datos de postfirma recibidos son inválidos";
	   [self.servletRest storeDataError:errorToSend stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
    } else {
	   self.responseMessage = @"batch_signs_all_ok";
	   for (NSDictionary *signDict in responseDict[@"signs"]) {
		  if (![signDict[@"result"] isEqualToString:@"DONE_AND_SAVED"]) {
			 self.responseMessage = @"batch_signs_ok_with_signs_error";
			 break;
		  }
	   }
	   
	   [self.servletRest storeData:jsonData certificateBase64:self.urlSafeCertificateData stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
    }
}

- (void)didErrorBachPresign:(NSString *)errorMessage {
    self.responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
}

- (void)didErrorBachPostsign:(NSString *)errorMessage {
    self.responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
}

- (void)didSuccessLoadDataFromServer:(NSDictionary *)responseDict {
    self.parametersBatch = [self getDataOperation:responseDict];
    [self presign];
}

- (void)didErrorLoadDataFromServer:(NSString *)errorMessage {
    self.responseMessage = @"batch_signs_generic_error";
    [self.servletRest storeDataError:errorMessage stServlet:self.parametersBatch.stservlet cipherKey:self.parametersBatch.cipherKey docId:self.parametersBatch.identifier];
}

- (void)didSuccessStoreData:(NSString *)response {
    if ([self.responseMessage isEqualToString:@"batch_signs_generic_error"]) {
	   if (self.completionHandler) {
		  self.completionHandler(self.responseMessage, [NSError errorWithDomain:@"BatchSignUseCase" code:-1 userInfo:@{NSLocalizedDescriptionKey: response}]);
	   }
    } else {
	   if (self.completionHandler) {
		  self.completionHandler(self.responseMessage, nil);
	   }
    }
}

- (void)didErrorStoreData:(NSString *)errorMessage {
    if (self.completionHandler) {
	   self.completionHandler(@"batch_signs_generic_error", [NSError errorWithDomain:@"BatchSignUseCase" code:-1 userInfo:@{NSLocalizedDescriptionKey: errorMessage}]);
    }
}

@end
