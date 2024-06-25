    //
    //  AOSignViewController.m
    //  Firma_iOS
    //
    //

#import "AOSignViewController.h"
#import "CADESSignUtils.h"
#import "CADESConstants.h"
#import "AlertProgressBar.h"
#import "CADESMonoPhase.h"
#include "CADESOID.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "DesCypher.h"
#import "Base64.h"
#import "AOAboutViewController.h"
#import "AOCounterSignXMLParser.h"
#import "AOCounterSignPreItems.h"
#import "CertificateUtils.h"
#import "CommonAlert.h"
#import "GlobalConstants.h"
#import "BatchSignUseCase.h"
#import "AORegisteredCertificatesTVC.h"
#import "UIFont+Utils.h"

@interface AOSignViewController ()

@end

@implementation AOSignViewController

@synthesize parameters = _parameters;
@synthesize nombreCert = _nombreCert;
@synthesize certificateName = _certificateName;
@synthesize signButton = _signButton;
@synthesize base64UrlSafeCertificateData = _base64UrlSafeCertificateData;

    //Datos globales que se usarán para la invocación a los distintos servlets
NSString *operation       = NULL;
NSString *datosInUse      = NULL;
NSString *signAlgoInUse   = NULL;
NSString *docId           = NULL;
NSString *cipherKey       = NULL;
NSString *urlServlet      = NULL;
NSString *signFormat      = NULL;
NSString *extraParams     = NULL;
NSDictionary *dictExtraParams = NULL;
NSString *triphasicServerURL = NULL;
NSString *fileId          = NULL;
NSString *rtServlet       =NULL;
NSString *cloudName       =NULL;

bool storingData = false;
bool retrievingDataFromServlet = false;
bool postSign = false;
bool reportError = false;

AlertProgressBar *alertpb = NULL;

NSMutableData *receivedData = NULL;

NSString *receivedString = NULL;

    // Clave privada RSA
SecKeyRef privateKey = NULL;
-(void) setPrivateKey:(SecKeyRef) thePrivateKey
{
    privateKey = thePrivateKey;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
        //Establecemos el nombre del certificado del almacen
    self.nombreCert.text = [CertificateUtils sharedWrapper].selectedCertificateName;
    
        // Logo
    self.logo.accessibilityLabel = @"logo".localized;
    
    self.useCase = [[BatchSignUseCase alloc] initWithCertificate: self.base64UrlSafeCertificateData withDelegate:self andPrivateKey:privateKey];
    
    self.screenName = @"IOS AOSignViewController - Start signature process window";
    [self preloadData];
    if ([[self.parameters objectForKey:PARAMETER_NAME_OPERATION] isEqualToString: OPERATION_SELECT_CERTIFICATE]){
        [self applySelectCertificateText];
    } else {
        [self applySignCertificateText];
    }
}

-(void) applySelectCertificateText {
    [self.signCertificateSelectorLabel setText: @"selectcert_certificate_selector_label".localized];
    [self.signCertificateDescriptionLabel setText: @"selectcert_certificate_description_label".localized];
    self.title = @"send".localized;
    [self setSignBtnText:@"send"];
}

-(void) applySignCertificateText {
    [self.signCertificateSelectorLabel setText: @"sign_certificate_selector_label".localized];
    [self.signCertificateDescriptionLabel setText: @"sign_certificate_description_label".localized];
    self.title = @"sign".localized;
    [self setSignBtnText:@"sign"];
}

- (void)setSignBtnText: (NSString *)text {
    [self.signButton setTitle: text.localized forState:UIControlStateNormal];
    [self.signButton.titleLabel setFont:[[UIFont alloc] mediumSystemFontScaled]];
}


-(IBAction)didClickSignButton:(id)sender
{
    if([[self.parameters objectForKey:PARAMETER_NAME_OPERATION] isEqualToString: OPERATION_SELECT_CERTIFICATE]){
        [self startSendingProcess];
            //This process will not be tracked by Google Analytics
    } else {
        [self startSignatureProcess];
        
        id<GAITracker> tracker= [[GAI sharedInstance] defaultTracker];
        NSDictionary *urlParameters = self.parameters;
        
        NSString *format = @"";
        if([urlParameters objectForKey:PARAMETER_NAME_FORMAT] != NULL)
            format = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_FORMAT]];
        NSString *algorithm = @"";
        if([urlParameters objectForKey:PARAMETER_NAME_ALGORITHM2] != NULL)
            algorithm  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_ALGORITHM2]];
        
        NSString *label=@"Operacion='1', formato='";
        label=[label stringByAppendingString:format];
        label=[label stringByAppendingString:@"', algoritmo='"];
        label=[label stringByAppendingString:algorithm];
        label=[label stringByAppendingString:@"'"];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"IOS Signature"     // Event category (required)
                                                              action:@"Signature"  // Event action (required)
                                                               label:label          // Event label
                                                               value:nil] build]];    // Event value
    }
}


/*****************************************************************/
/******** METODOS DE LA PROPIA FIRMA Y ENVIO AL SERVIDOR *********/
/*****************************************************************/

-(void) preloadData
{
    NSDictionary *urlParameters = self.parameters;
    if ([[urlParameters objectForKey:PARAMETER_NAME_OPERATION] isEqualToString: OPERATION_SELECT_CERTIFICATE]) {
        
            //parámetro de la clave de cifrado con el servidor "key"
        if([urlParameters objectForKey:PARAMETER_NAME_CIPHER_KEY] != NULL)
            cipherKey  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_CIPHER_KEY]];
        if([urlParameters objectForKey:PARAMETER_NAME_ID])
            docId      = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_ID]];
        
    } else {
            //parámetro donde se recogen los datos originales. El documento llega dentro del parámetro "dat"
        if([urlParameters objectForKey:PARAMETER_NAME_DAT] != NULL) {
            NSString *data =[urlParameters objectForKey:PARAMETER_NAME_DAT];
            data = [data stringByRemovingPercentEncoding];
            datosInUse = [[NSString alloc] initWithString:data];
        } else {
                //Notificamos del error al servidor si es posible
            NSString *errorToSend = @"";
            errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
            errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
            errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA];
            dispatch_async(dispatch_get_main_queue(), ^{
                [CommonAlert createAlertWithTitle:@"error".localized message: @"error_datos_firmar".localized cancelButtonTitle:@"cerrar".localized showOn:self onComplete:^{
                    [self backToAboutViewController];
                }];
            });
            self.signButton.userInteractionEnabled = NO;
            return;
        }
        if([urlParameters objectForKey:PARAMETER_NAME_FILE_ID] != NULL)
            fileId = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_FILE_ID]];
        
        if([urlParameters objectForKey:PARAMETER_NAME_RTSERVLET] != NULL)
            rtServlet = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_RTSERVLET]];
        
            //parámetro de la clave de cifrado con el servidor "key"
        if([urlParameters objectForKey:PARAMETER_NAME_CIPHER_KEY] != NULL)
            cipherKey  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_CIPHER_KEY]];
        
        if([urlParameters objectForKey:PARAMETER_NAME_ID])
            docId      = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_ID]];
        
            // Si no tenemos datos es que hay que recojerlos del servidor
        if (datosInUse == nil)
        {
                // Si no hay identificador de datos es un error, porque ni hay datos ni podemos recogerlos del servidor
            if(fileId == nil)
            {
                    //Notificamos del error al servidor si es posible
                NSString *errorToSend = @"";
                errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
                errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA];
                [CommonAlert createAlertWithTitle:@"error".localized message: @"error_datos_firmar".localized cancelButtonTitle:@"cerrar".localized showOn:self onComplete:^{
                    [self backToAboutViewController];
                }];
                self.signButton.userInteractionEnabled = NO;
                return;
            }
                // En este punto buscamos los datos en el servidor intermedio
            else
            {
                if(cipherKey != NULL && rtServlet != NULL)
                {
                    [self loadDataFromRtservlet:fileId rtServlet:rtServlet];
                }
                    // Si no teniamos clave de cifrado o dirección del servidor intermedio es un error
                else
                {
                        //Notificamos del error al servidor si es posible
                    NSString *errorToSend = @"";
                    errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
                    errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                    errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA];
                    [self errorReportAsync:errorToSend];
                    [CommonAlert createAlertWithTitle: @"error".localized message:@"error_datos_firmar".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
                        [self backToAboutViewController];
                    }];
                    self.signButton.userInteractionEnabled = NO;
                    return;
                }
            }
        }
        if (docId == nil)
        {
                //Notificamos del error al servidor si es posible
            NSString *errorToSend = @"";
            errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA_ID];
            errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
            errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA_ID];
            [self errorReportAsync:errorToSend];
            [CommonAlert createAlertWithTitle:@"error".localized message: @"error_datos_firmar".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
                [self backToAboutViewController];
            }];
            self.signButton.userInteractionEnabled = NO;
            return;
        }
    }
}

-(void) startSignatureProcess
{
    NSDictionary *urlParameters = self.parameters;
    
        //parámetro de operacion "op"
    if([urlParameters objectForKey:PARAMETER_NAME_OPERATION] != NULL)
        operation  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_OPERATION]];
    
        //Si la firma es batch
    if([operation isEqualToString:OPERATION_BATCH]){
            //iniciamos la barra de progreso.
        alertpb = [[AlertProgressBar alloc]init];
        [alertpb createAndShowProgressBar:self withMessage: @"processing".localized];
        [self.useCase signBatch:urlParameters];
        return;
    }
    
        //parámetro del servlet donde se almacena la firma "servlet"
    if([urlParameters objectForKey:PARAMETER_NAME_STSERVLET] != NULL) {
        urlServlet = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_STSERVLET]];
        urlServlet = [urlServlet stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    }
    
        //parámetro "format" que indica el formato de firma.
    if([urlParameters objectForKey:PARAMETER_NAME_FORMAT] != NULL)
        signFormat = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_FORMAT]];
    
        //parámetro "algorithm" que indica el algoritmo usado para la firma.
    if([urlParameters objectForKey:PARAMETER_NAME_ALGORITHM2] != NULL)
        signAlgoInUse  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_ALGORITHM2]];
    
        //parámetro properties
    if([urlParameters objectForKey:PARAMETER_NAME_PROPERTIES] != NULL)
    {
        extraParams = [urlParameters objectForKey:PARAMETER_NAME_PROPERTIES];
        
            //URL DECODE
        NSData *dataReceived = [Base64 decode:extraParams urlSafe:true];
        
        NSString* stringDataReceived = [[NSString alloc] initWithData:dataReceived encoding:NSUTF8StringEncoding];
        
        NSDictionary *dict = [CADESSignUtils javaProperties2Dictionary:stringDataReceived];
        dictExtraParams = dict;
        
        triphasicServerURL = [dict objectForKey:PARAMETER_NAME_TRIPHASIC_SERVER_URL];
        
        if (![[triphasicServerURL substringFromIndex:[triphasicServerURL length] - 1]  isEqual: @"e"]) {
            
            triphasicServerURL = [triphasicServerURL substringToIndex:[triphasicServerURL length] - 1];
        }
    }
    
    if([urlParameters objectForKey:PARAMETER_NAME_TARGET] != NULL)
    {
        NSString *extraParams2 = [urlParameters objectForKey:PARAMETER_NAME_TARGET];
        
        if(extraParams2 != NULL)
        {
            extraParams2 = [[NSString alloc] initWithData:[Base64 decode:extraParams2 urlSafe:true] encoding:NSUTF8StringEncoding];
            
            NSMutableDictionary *aux = [NSMutableDictionary dictionaryWithDictionary:dictExtraParams];
            
            if(![extraParams2 isEqualToString:PARAMETER_NAME_TARGET_TREE] || ![extraParams2 isEqualToString:PARAMETER_NAME_TARGET_LEAFS]){
                    //Notificamos del error al servidor si es posible
                NSString *errorToSend = @"";
                errorToSend = [errorToSend stringByAppendingString:ERROR_NOT_TARGET];
                errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_NOT_TARGET];
                [self errorReportAsync:errorToSend];
                [CommonAlert createAlertWithTitle:@"error".localized message:@"error_objetivo_contrafirma".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
                    [self backToAboutViewController];
                }];
                self.signButton.userInteractionEnabled = NO;
                return;
            }
            else
            {
                if(aux == NULL)
                {
                    aux = [[NSMutableDictionary alloc] init];
                }
                [aux setObject:extraParams2 forKey:PARAMETER_NAME_TARGET];
                
                dictExtraParams = aux;
            }
        }
    }
    
    if (!([operation isEqualToString:OPERATION_SIGN]
          || [operation isEqualToString:OPERATION_COSIGN]
          || [operation isEqualToString:OPERATION_COUNTERSIGN]))
    {
            //Notificamos del error al servidor si es posible
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_UNSUPPORTED_OPERATION_NAME];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_UNSUPPORTED_OPERATION_NAME];
            //hay que hacer esta llamada asincrona!!!
        [self errorReportAsync:errorToSend];
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_codigo_desconocido".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    
    if (urlServlet == nil)
    {
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_url_servidor".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    
    if (signFormat == nil) {
            //Notificamos del error al servidor si es posible
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_NOT_SUPPORTED_FORMAT];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_NOT_SUPPORTED_FORMAT];
        [self errorReportAsync:errorToSend];
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_formato_firma".localized cancelButtonTitle:@"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    else if (!([signFormat isEqualToString:CADES_FORMAT]
               || [signFormat isEqualToString:CADES_TRI_FORMAT]
               || [signFormat isEqualToString:PADES_TRI_FORMAT]
               || [signFormat isEqualToString:XADES_TRI_FORMAT]
               || [signFormat isEqualToString:PADES_FORMAT]
               || [signFormat isEqualToString:XADES_FORMAT]
               || [signFormat isEqualToString:NONE_FORMAT]
               || [signFormat isEqualToString:NONE_TRI_FORMAT]
               || [signFormat isEqualToString:FACTURAE_FORMAT]
               || [signFormat isEqualToString:FACTURAE_TRI_FORMAT] ))
    {
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_formato_no_soportado".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    
    if(![CADESSignUtils isValidAlgorithm:signAlgoInUse])
    {
        
            //Notificamos del error al servidor si es posible
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_NOT_SUPPORTED_ALGORITHM];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_NOT_SUPPORTED_ALGORITHM];
        [self errorReportAsync:errorToSend];
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_algoritmo_no_soportado".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    
        // Peticion 02/02/2023: la firma cades monofasica se forzará a realizarla de forma trifásica
    if ([signFormat isEqualToString:NONE_FORMAT])
    {
        [self noneMonoPhasic];
    } else if ([signFormat isEqualToString:CADES_FORMAT] ||
               [signFormat isEqualToString:CADES_TRI_FORMAT] ||
               [signFormat isEqualToString:PADES_FORMAT] ||
               [signFormat isEqualToString:PADES_TRI_FORMAT] ||
               [signFormat isEqualToString:XADES_FORMAT] ||
               [signFormat isEqualToString:XADES_TRI_FORMAT] ||
               [signFormat isEqualToString:NONE_TRI_FORMAT] ||
               [signFormat isEqualToString:FACTURAE_FORMAT] ||
               [signFormat isEqualToString:FACTURAE_TRI_FORMAT] )
    {
            //Invocamos la firma trifásica
        [self cadesTriPhasic];
    }
    
    self.signButton.userInteractionEnabled = NO;
    self.signButton.enabled = NO;
    
}


-(void) startSendingProcess{
    NSDictionary *urlParameters = self.parameters;
    
        //parámetro de operacion "op"
    if([urlParameters objectForKey:PARAMETER_NAME_OPERATION] != NULL)
        operation  = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_OPERATION]];
    
        //parámetro del servlet donde se almacena la firma "servlet"
    if([urlParameters objectForKey:PARAMETER_NAME_STSERVLET] != NULL) {
        urlServlet = [[NSString alloc] initWithString:[urlParameters objectForKey:PARAMETER_NAME_STSERVLET]];
        urlServlet = [urlServlet stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    }
    
        //Notify the error if this parameter does not exist
    if (urlServlet == nil)
    {
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_url_servidor".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        return;
    }
    
    [self sendCertificate];
    
    self.signButton.userInteractionEnabled = NO;
    self.signButton.enabled = NO;
    
}

/*
 Method for send the certificate
 */

-(void)sendCertificate{
    
        //Creamos la cadena de envío al servidor POST
    NSString *post = @"";
    post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:OPERATION_PUT];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_ID];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:docId];
    post = [post stringByAppendingString:HTTP_AND];
    
        //cifrado del certificado
    
        // Get the certificate
    NSString * certificateString = [Base64 urlSafeEncode: self.base64UrlSafeCertificateData];
    NSData *data = [Base64 decode:certificateString urlSafe:true];
    NSString *encryptedDataB64 = [DesCypher cypherData:data sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
    
        // Se envia el certificado cifrado y en base64
    post = [post stringByAppendingString:PARAMETER_NAME_DAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:encryptedDataB64];
    
        //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
        // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL* requestUrl = [[NSURL alloc] initWithString:urlServlet];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    storingData = true;
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
    
        //iniciamos la barra de progreso.
    alertpb = [[AlertProgressBar alloc]init];
    [alertpb createAndShowProgressBar:self withMessage: @"processing".localized];
    
}

/**
 Método donde se realiza la firma monofasica.
 
 parámetros:
 -----------
 
 */
-(void)cadesMonoPhasic
{
    NSData *contentData = [Base64 decode:datosInUse urlSafe:true];
    NSString *contentDescription = [[NSString alloc]init];
    contentDescription = BINARY;
    NSString *policyOID = NULL;
    NSString *policyHash = NULL;
    NSString *policyUri = NULL;
    char *policyHashAlg = NULL;
    NSString *mode = PROPERTIES_PARAMETER_MODE_IMPLICIT;
    char *precalculatedHashAlgorithm = NULL;
    NSData *precalculatedHash = NULL;
    
    char *signAlgorithm = RSA_OID; //siempre se usa RSA, por ahora.
    int signingCertificateV2 = 0; //Por defecto es SigningCertificateV1
    
    if(dictExtraParams != NULL)
    {
        
            //Parámetro de modo: explícito o implícito
        if([dictExtraParams objectForKey:PROPERTIES_PARAMETER_MODE]!=NULL)
        {
            if([[dictExtraParams objectForKey:PROPERTIES_PARAMETER_MODE] isEqualToString:PROPERTIES_PARAMETER_MODE_EXPLICIT])
                mode = PROPERTIES_PARAMETER_MODE_EXPLICIT;
        }
        
            //parámetro de algoritmo precalculado
        if([dictExtraParams objectForKey:PROPERTIES_PARAMETER_PRECALCULATEDHASHALGORITHM]!=NULL)
        {
            
                //tenemos que deshacer el formato "http://www.w3.org/2000/09/xmldsig#sha256"
            NSString *auxPreCalculatedHashAlg = [dictExtraParams objectForKey:PROPERTIES_PARAMETER_PRECALCULATEDHASHALGORITHM];
            NSRange range = [auxPreCalculatedHashAlg rangeOfString:@"#" options:NSBackwardsSearch];
            auxPreCalculatedHashAlg = [auxPreCalculatedHashAlg substringFromIndex:range.location+1];
            
            precalculatedHashAlgorithm = [CADESSignUtils getHashAlgorithmOID:auxPreCalculatedHashAlg];
            
                //Si el HASH viene precalculado, entonces viene el hash en si en los datos!!!!
            precalculatedHash = contentData;
            
            mode = PROPERTIES_PARAMETER_MODE_EXPLICIT;
            
                //Modificamos a SigningCertificateV2 en caso de que venga otro algoritmo de hash que no sea el sha1
            if(strcmp(precalculatedHashAlgorithm, SHA1_OID)!=0){
                signingCertificateV2 = 1; // Usamos SigningCertificateV2
            }
        }
        
            //Parámetro de la política de firma
        if([dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIER]!=NULL
           && [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIERHASH]!=NULL
           && [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIERHASHALGORITHM]!=NULL
           && [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYQUALIFIER]!=NULL)
        {
            
            policyOID = [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIER];
            
                //quitamos el "urn:oid:" en caso de que lo tuviera
            policyOID = [policyOID stringByReplacingOccurrencesOfString:@"urn:oid:" withString:@""];
            
            policyHash = [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIERHASH];
            
                //obtenemos el algoritmo de la política
            NSString *auxPolicyHashAlg = NULL;
            auxPolicyHashAlg = [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYIDENTIFIERHASHALGORITHM];
            NSRange range = [auxPolicyHashAlg rangeOfString:@"#" options:NSBackwardsSearch];
            auxPolicyHashAlg = [auxPolicyHashAlg substringFromIndex:range.location+1];
            policyHashAlg= [CADESSignUtils getHashAlgorithmOID:auxPolicyHashAlg];
            
                //URL de la política
            policyUri = [dictExtraParams objectForKey:PROPERTIES_PARAMETER_POLICYQUALIFIER];
            
                //Modificamos a SigningCertificateV2 en caso de que venga otro algoritmo de hash que no sea el sha1
            if(strcmp(policyHashAlg, SHA1_OID)!=0){
                signingCertificateV2 = 1; // Usamos SigningCertificateV2
            }
        }
        
            //Parámetro de SigningCertificateV2
        if([dictExtraParams objectForKey:PROPERTIES_PARAMETER_SIGNINGCERTIFICATEV2]!=NULL)
        {
            bool v2 = [[dictExtraParams objectForKey:PROPERTIES_PARAMETER_SIGNINGCERTIFICATEV2] boolValue];
            if (v2){
                signingCertificateV2 = 1;
            }
        }
        else
        {
            if(strcmp([CADESSignUtils getAlgorithmOID:signAlgoInUse],SHA1_OID)!=0)
            {
                signingCertificateV2 = 1; // Usamos SigningCertificateV2
            }
        }
        
    }
    else
    {
        if(strcmp([CADESSignUtils getAlgorithmOID:signAlgoInUse],SHA1_OID)!=0)
        {
            signingCertificateV2 = 1; // Usamos SigningCertificateV2
        }
    }
    
    NSData *signature = [CADESMonoPhase
                         getCadesMonoPhase: self.base64UrlSafeCertificateData
                         mode: mode
                         contentData: contentData
                         privateKey: &privateKey
                         signAlgoInUse: signAlgoInUse
                         contentDescription: contentDescription
                         policyOID: policyOID
                         policyHash: policyHash
                         policiHashAlg: policyHashAlg                               
					policyUri: policyUri
                         signAlgorithm: signAlgorithm
                         signingCertificateV2: signingCertificateV2
                         precalculatedHashAlgorithm: precalculatedHashAlgorithm
                         precalculatedHash: precalculatedHash];
    
        //iniciamos la barra de progreso.
    alertpb = [[AlertProgressBar alloc]init];
    [alertpb createAndShowProgressBar:self withMessage: @"processing".localized];
    
        //invocamos al almacenamiento de la firma
    NSString *finalSignature = [Base64 encode:signature urlSafe:true];
    [self storeData:finalSignature];
}

-(void)noneMonoPhasic
{
    
    NSData *contentData = [Base64 decode:datosInUse urlSafe:true];
    
        //    Aplicamos PCSK1 y almacenamos la firma
    if(contentData.length > 0)
    {
        
	   //We sign the data with PKCS1
	   CADESSignUtils *signUtils = [[CADESSignUtils alloc] init];
	   NSData *dataSigned = [signUtils signDataWithPrivateKey:&privateKey data:contentData algorithm: signAlgoInUse];
        
            //Start progress bar.
        alertpb = [[AlertProgressBar alloc]init];
        [alertpb createAndShowProgressBar:self withMessage: @"processing".localized];
        
            //Store the sign
        NSString *finalSignature = [Base64 encode:dataSigned urlSafe:true];
        [self storeData:finalSignature];
    }
}

/**
 Método donde se realiza la petición asíncrona al servidor de firma.
 Se recogen los datos introducidos por url y se monta la peticiíon de tipo POST.
 
 parámetros:
 -----------
 
 */
-(void)cadesTriPhasic
{
    /* LLAMADA ASINCRONA */
    
    NSString *post = @"";
        //OPERATION OP : PRE
    post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:OPERATION_PRESIGN];
    post = [post stringByAppendingString:HTTP_AND];
    
        //COPERATION = SIGN / COSIGN /COUNTERSIGN
    post = [post stringByAppendingString:PARAMETER_NAME_COPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:operation];
    post = [post stringByAppendingString:HTTP_AND];
    
        //DOCID: DATOS A FIRMAR
    post = [post stringByAppendingString:PARAMETER_NAME_DOCID];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:datosInUse];
    post = [post stringByAppendingString:HTTP_AND];
    
        //FORMAT: FORMATO DE FIRMA
    post = [post stringByAppendingString:PARAMETER_NAME_FORMAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:signFormat];
    post = [post stringByAppendingString:HTTP_AND];
    
        //ALGORITHM: ALGORITMO DE FIRMA
    post = [post stringByAppendingString:PARAMETER_NAME_ALGORITHM];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:signAlgoInUse];
    post = [post stringByAppendingString:HTTP_AND];
    
        //CERT: CERTIFICADO DE FITMA
    post = [post stringByAppendingString:PARAMETER_NAME_CERT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    
    NSString *certificate = [Base64 urlSafeEncode: self.base64UrlSafeCertificateData];
    
    certificate = [certificate stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    post = [post stringByAppendingString:certificate];
    
        //PARAMETERS: PARAMETROS EXTRA
    if(extraParams != NULL)
    {
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_EXTRA_PARAM];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:extraParams];
    }
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
        // Obtenemos la URL de las preferencias
        // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL *requestUrl = [self getDefaultTriphaseServer];
    if (requestUrl == nil) {
            // Si no tenemos url dels ervidor no podemos continuar
        return;
    }
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [connection start];
        });
    });
    
        //iniciamos la barra de progreso.
    alertpb = [[AlertProgressBar alloc]init];
    [alertpb createAndShowProgressBar:self withMessage: @"processing".localized];
}

-(NSURL*) getDefaultTriphaseServer {
    if(triphasicServerURL != NULL)
    {
            // Si tenemos url del servidor trifasico la devolvemos
        return [[NSURL alloc] initWithString:triphasicServerURL];
    } else if (rtServlet != nil) {
            // Creamos la url del servidor trifasico a partir del rtservlet y el path por defecto de firma trifasica
        NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString: rtServlet];
        urlComponents.query = nil;
        urlComponents.path = PATH_DEFAULT_TRIPHASE_SIGN;
        return urlComponents.URL;
    } else {
            // No tenemos url de servidor trifase, mostramos aviso y enviamos error al servidor intermedio
            //Notificamos del error al servidor si es posible
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA_SERVER_TRIPHASE];
            //hay que hacer esta llamada asincrona!!!
        [self errorReportAsync:errorToSend];
        [CommonAlert createAlertWithTitle:@"error".localized message:@"error_server_triphase".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        return nil;
    }
}

/* METODOS DONDE SE RECIBE LA RESPUESTA DE LA CONEXION ASINCRONA */
/**
 Método donde se recibe la respuesta de la petición asíncrona.
 
 parámetros:
 -----------
 didReceiveData: Conexión establecida asíncrona.
 data:           Datos recibidos del servidor.
 */
    //los datos van llegando por "rafagas". Lo que hay que ir haciendo es ir juntandolos todos.
-(void)connection:(NSURLConnection *)connection didReceiveData: (NSData *)data
{
        // Append the new data to the receivedData.
    [receivedData appendData:data];
}

    //Se confirma la respuesta. aprovechamos para inicializar los datos de respuesta
-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    receivedData = [[NSMutableData alloc] init];
}

    //cuando se ha terminado de leer los datos recibidos, terminamos ya la conexion y se pasa a la prefirma.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
        // Connection succeeded in downloading the request.
    
        // Convert received data into string.
    receivedString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
        //se procesa la respuesta del servidor.
        //Se recoge el resultado de la petición de almacenamiento
    if(storingData)
    {
        storingData = false;
        
            //Obtenemos la respuesta del servidor.
        NSString* responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        
            //quitamos el progressbar indefinido
        [alertpb destroy:^{
                //se procesa la respuesta del servidor.
            NSString* title = ([responseString hasPrefix: OK]) ? @"ok".localized : @"error".localized;
            NSString* message = [[self.parameters objectForKey:PARAMETER_NAME_OPERATION] isEqualToString: OPERATION_SELECT_CERTIFICATE] ? [self selectCertificateAlertText: responseString]:[self signAlertText:responseString];
            [CommonAlert createAlertWithTitle: title message: message cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
                [self backToAboutViewController];
            }];
        }];
    }
        // Se recogen los datos del servidor
    else if (retrievingDataFromServlet) {
        retrievingDataFromServlet = false;
            //Obtenemos la respuesta del servidor.
        NSString* responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        
        @try
        {
            NSData *finalDecoded = [DesCypher decypherData:responseString sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
            
            datosInUse =[[NSString alloc] initWithString:[Base64 encode:finalDecoded urlSafe:true]];
            
            
        }
        @catch (NSException *exception)
        {
        }
    }
        //Obtenemos la postfirma
    else if(postSign) {
        postSign = false;
        
            //Obtenemos la respuesta del servidor.
        NSString* responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        
            //se valida si la respuesta es correcta
        if([responseString hasPrefix: OK]){
            NSRange range = [responseString rangeOfString: @"="];
            if(range.length > 0)
            {
                NSString *parte2 = [responseString substringFromIndex:range.location + 1];//le sumamos 1 para que no coja el "="
                    //invocamos al almacenamiento de la firma
                [self storeData:parte2];
            }
        }
        else
        {
            [alertpb destroy:^{
                    //Quitamos la notificación de la pila de notificaciones. Si se produce algun error, no quedará en la pila la notificación y por lo tanto, cuando se vuelva a ejecutar, no se ejecutará n-veces las llamadas que hay en la pila de notificacioens.
                NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                [notificationCenter removeObserver:self name:@"eventType" object:nil];
                NSString *errorToSend = @"";
                errorToSend = [errorToSend stringByAppendingString:ERROR_SIGNING];
                errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_SIGNING];
                [self errorReportAsync:errorToSend];
                [CommonAlert createAlertWithTitle: @"error".localized message: @"error_proceso_firma".localized cancelButtonTitle:@"cerrar".localized showOn:self onComplete:^{
                    [self backToAboutViewController];
                }];
            }];
        }
    }
    else if(reportError)
    {
        reportError = false;
        [alertpb destroy];
    }
    else if ([receivedString hasPrefix:@"ERR-"]){
        [alertpb destroy:^{
            [CommonAlert createAlertWithTitle: @"error".localized message: receivedString.localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
                [self backToAboutViewController];
            }];
        }];
    }
        //en cualquier otro caso, se trataría la prefirma.
    else
    {
        [self Sign:receivedString];
    }
}

- (NSString *) selectCertificateAlertText:(NSString*)responseString {
    return ([responseString hasPrefix: OK]) ? @"certificate_successfully_selected".localized : @"error_process_select_certificate".localized;
}

- (NSString *) signAlertText:(NSString*)responseString {
    return ([responseString hasPrefix: OK]) ? @"proceso_finalizado_trifasico".localized : @"error_proceso_firma".localized;
}

/**************************/
/**** PROTECCIONES SSL ****/
/**************************/

    //para las protecciones ssl

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

    //Acepta todas las conexiones ssl
-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
}

/**
 Método donde se procesan los errores de conexión con el servidor.
 
 parámetros:
 -----------
 connection:        Conexión establecida asíncrona.
 didFailWithError:  Error producido.
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
        // Liberar la conexión
    
        //destruimos la barra de progreso
    [alertpb destroy: ^{
            //Notificamos del error al servidor
        NSString *errorToSend = @"";
        errorToSend = [errorToSend stringByAppendingString:ERROR_SIGNING];
        errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
        errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_SIGNING];
            // Mostramos un mensaje con el error producido.
        [CommonAlert createAlertWithTitle: @"error".localized message: @"error_conexion_servidor".localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
        self.signButton.userInteractionEnabled = NO;
        self.signButton.enabled=NO;
        return;
    }];
}

/**
 Método que trata los datos recibidos del servidor en base64.
 Una vez tratados los datos, se ejecuta la firma y se invoca la llamada para la ejecución del post.
 
 parámetros:
 -----------
 dataReceivedb64: Cadena recibida del servidor y que contiene un properties de java.
 
 */
-(void) Sign: (NSString*) dataReceivedb64
{
        //Se reciben los datos en base64 y se decodifican
    NSData *dataReceived = [Base64 decode:dataReceivedb64 urlSafe: true];
    NSString* stringDataReceived = [[NSString alloc] initWithData:dataReceived encoding:NSUTF8StringEncoding];
    
        // Usado para almacenar las properties que se reciben en la URL (no se usa en el proceso de contrafirma).
    NSDictionary *dict = [[NSDictionary alloc] init];
    
        //Los datos recibidos son un xml, lo parseamos y creamos una estructura de datos para acceder a los datos.
    AOCounterSignXMLParser *parser = [[AOCounterSignXMLParser alloc] init];
    NSMutableArray *firmas = [parser parseXML: dataReceived];
    
        // Recorremos las prefirmas
    for (Firma *firma in firmas) {
        if(firma == NULL){
            [alertpb destroy: ^{
                [CommonAlert createAlertWithTitle:@"error".localized message:@"error_proceso_firma".localized cancelButtonTitle:@"cerrar".localized showOn:self onComplete:^{
                    [self backToAboutViewController];
                }];
                return;
            }];
        }
        
        NSString *pre = [firma.params objectForKey:PRE];
        pre = [pre stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        NSData *data = [Base64 decode:pre urlSafe:true];
        
        if(data.length > 0)
        {
		  //Con los datos de la prefirma decodificados, se procede a realizar la firma pkcs1.
		  CADESSignUtils *signUtils = [[CADESSignUtils alloc] init];
		  NSData *dataSigned = [signUtils signDataWithPrivateKey:&privateKey data:data algorithm:signAlgoInUse];
            
                // Contiene las prefirmas firmadas
            NSString *stringSigned = [Base64 encode:dataSigned];
            [firma.params setValue: stringSigned forKey:@"PK1"];
        }
    }
    
        // Generamos el XML.
    AOCounterSignPreItems *preItems = [[AOCounterSignPreItems alloc] init];
    
        // XML enviado al servidor con la fecha en la que se elaboro el pkcs7 y las parejas de datos firmados y "dummy data".
    NSData *encodedData = [[NSData alloc] init];
    
    NSString *newXML = [[NSString alloc] init];
    newXML = [preItems generateXML: firmas];
    newXML = [newXML stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    encodedData = [newXML dataUsingEncoding: NSUTF8StringEncoding];
    
        //Creamos la cadena de envío al servidor POST
    NSString *post =[[NSMutableString alloc] init];
    
        // Atributo -> OP
    post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:OPERATION_POSTSIGN];
    post = [post stringByAppendingString:HTTP_AND];
    
        // Atributo -> COP
    post = [post stringByAppendingString:PARAMETER_NAME_COPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:operation];
    post = [post stringByAppendingString:HTTP_AND];
    
    NSString *needData = [dict objectForKey:PROPERTY_NAME_NEED_DATA];
    if (![needData isEqualToString:STRING_FALSE]) {
            // Atributo DOC
        post = [post stringByAppendingString:PARAMETER_NAME_DOCID];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:datosInUse];
        post = [post stringByAppendingString:HTTP_AND];
    }
    
        // Atributo -> FORMAT
    post = [post stringByAppendingString:PARAMETER_NAME_FORMAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:signFormat];
    post = [post stringByAppendingString:HTTP_AND];
    
        // Atributo -> ALGO
    post = [post stringByAppendingString:PARAMETER_NAME_ALGORITHM];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:signAlgoInUse];
    post = [post stringByAppendingString:HTTP_AND];
    
        // Atributo -> CERT
    post = [post stringByAppendingString:PARAMETER_NAME_CERT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:[Base64 urlSafeEncode: self.base64UrlSafeCertificateData]];
    post = [post stringByAppendingString:HTTP_AND];
    
        // Atributo -> PARAMS
    if(extraParams != NULL){
        post = [post stringByAppendingString:PARAMETER_NAME_EXTRA_PARAM];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:extraParams];
        post = [post stringByAppendingString:HTTP_AND];
    }
    
        // Atributo -> SESSION
    NSString *encodedString = [Base64 encode:encodedData urlSafe:true];
    post = [post stringByAppendingString:PROPERTY_NAME_SESSION_DATA_PREFIX];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString: encodedString];
    
        //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding: NSUTF8StringEncoding allowLossyConversion: YES];
    NSString *postLength = [NSString stringWithFormat: @"%d", (int)[postData length]];
    
        // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL *requestUrl = [self getDefaultTriphaseServer];
    if (requestUrl == nil) {
            // Si no tenemos url dels ervidor no podemos continuar
        return;
    }
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody: postData];
    
    postSign = true;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
}


/**
 Método que realiza la operacion "put" de la firma en el servidro de almacenamiento. La invocación al servidor es mediante una petición POST.
 
 parámetros:
 -----------
 dataSign: firma que será almacenada en el servidor.
 
 */
-(void)storeData:(NSString*) dataSign
{
    
        //Creamos la cadena de envío al servidor POST
    NSString *post = @"";
    post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:OPERATION_PUT];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
    post = [post stringByAppendingString:HTTP_AND];
    post = [post stringByAppendingString:PARAMETER_NAME_ID];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:docId];
    post = [post stringByAppendingString:HTTP_AND];
    
        //cifrado de la firma
    NSData *signdata = [Base64 decode:dataSign urlSafe:true];
    NSString *encryptedSignDataB64 = [DesCypher cypherData:signdata sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
    
        //cifrado del certificado
    NSString * certificateString = [Base64 urlSafeEncode: self.base64UrlSafeCertificateData];
    NSData *dataCertificate = [Base64 decode:certificateString urlSafe:true];
    NSString *encryptedCertificateDataB64 = [DesCypher cypherData:dataCertificate sk:[cipherKey dataUsingEncoding:NSUTF8StringEncoding]];
    
        // Concatenacion
    NSString *encryptedDataB64 = [NSString stringWithFormat:@"%@|%@", encryptedCertificateDataB64, encryptedSignDataB64];
    
        // Se envia la firma cifrada y en base64
    post = [post stringByAppendingString:PARAMETER_NAME_DAT];
    post = [post stringByAppendingString:HTTP_EQUALS];
    post = [post stringByAppendingString:encryptedDataB64];
    
        //Codificamos la url de post
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    
        // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL* requestUrl = [[NSURL alloc] initWithString:urlServlet];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval: 30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    
    storingData = true;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [connection start];
        });
    });
}

/**
 Obtiene los datos a firmar desde el servidor intermedio.
 
 parámetros:
 -----------
 fileId: Identificador del fichero de datos.
 rtServlet: Dirección del servidor intermedio.
 
 */
-(NSString *) loadDataFromRtservlet:(NSString*) fileId rtServlet:(NSString *) rtServlet
{
    
    NSString* responseString = NULL;
    
    if(rtServlet != NULL && fileId != NULL){
            //Creamos la cadena de envío al servidor POST
        NSString *post = @"";
        post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:OPERATION_GET];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_ID];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:fileId];
        
            //Codificamos la url de post
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
        
            // Obtenemos la URL del servidor de la pantalla de preferencias
        NSURL* requestUrl = [[NSURL alloc] initWithString:rtServlet];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
        [request setHTTPMethod:POST];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
        [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
        [request setHTTPBody:postData];
        
        retrievingDataFromServlet = true;
        
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [connection start];
            });
        });
    }
    return responseString;
}


/**
 Método que notifica de un error en la aplicación al servidor de guardado de firmas "storage" de forma síncrona.
 
 parámetros:
 -----------
 dataSign: error producido.
 
 */
-(void) errorReportAsync:(NSString*) error
{
    
    if(urlServlet != NULL && docId != NULL) {
            //Creamos la cadena de envío al servidor POST
        NSString *post =@"";
        post = [post stringByAppendingString:PARAMETER_NAME_OPERATION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:OPERATION_PUT];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:PARAMETER_NAME_VERSION_1_0];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_ID];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:docId];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_DAT];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:error];
        
            //Codificamos la url de post
            //Changed NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
        
            // Obtenemos la URL del servidor de la pantalla de preferencias
        NSURL* requestUrl = [[NSURL alloc] initWithString:urlServlet];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
        [request setHTTPMethod:POST];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
        [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
        [request setHTTPBody:postData];
        
        reportError = true;
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [connection start];
            });
        });
    }
}

- (void) backToAboutViewController {
    
        // Como se presenta de forma modal hacemos un dismiss y posteriormente lanzamos el controller de about como root view controller (No seria necesario hacer el dismiss porque al cambiar el root view controller desparace ese controller y todos los hijos)
    [self dismissViewControllerAnimated:NO completion:^() {
        UIViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AOAboutViewController"];
        UINavigationController *objectNav = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        [[UIApplication sharedApplication].keyWindow setRootViewController: objectNav];
        
    }];
}


- (void)didSuccessBatchSignUseCase:(NSString *)response{
        //quitamos el progressbar indefinido
    [alertpb destroy:^{
            //se procesa la respuesta del servidor.
        NSString* title = @"ok".localized;
        NSString* message = response.localized;
        [CommonAlert createAlertWithTitle: title message: message cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
            [self backToAboutViewController];
        }];
    }];
}

- (void)didErrorBatchSignUseCase:(NSString *)errorMessage{
    [alertpb destroy:^{
        [CommonAlert createAlertWithTitle: @"error".localized message: errorMessage.localized cancelButtonTitle: @"cerrar".localized showOn:self onComplete:^{
        }];
    }];
}

@end
