//
//  AORegisteredCertificatesTVC.m
//  Firma_iOS
//
//  Created by Rocio Tovar on 24/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import "AORegisteredCertificatesTVC.h"
#import "AOCertificateCell.h"
#import "OpenSSLCertificateHelper.h"
#import "CertificateUtils.h"
#import "AOUtils.h"
#import "ColorChart.h"
#import "AOSignViewController.h"
#import "CADESSignUtils.h"
#import "CADESConstants.h"
#import "AOEntity.h"
#import "DesCypher.h"
#import "AOXMLReader.h"
#import "CommonAlert.h"
#import "GlobalConstants.h"
#import "AlertProgressBar.h"

@interface AORegisteredCertificatesTVC ()
{
    AOCertificateInfo *_selectedCertificate;
    NSMutableArray *_certificatesArray;
    NSMutableDictionary *_opParameters;
    NSString *_idDocCert;
    NSString *_stServletCert;
    NSString *_fileIdCert;
    NSString *_rtServletCert;
    NSString *_cipherKeyCert;
    bool _reportErrorCert;
    bool _retrievingDataFromServletCert;
    bool shouldPerformSegue;
}

@end

@implementation AORegisteredCertificatesTVC
@synthesize _certificatesArray, editTableView;

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.numberOfRetries = 0;
    [self.editTableView setDelegate: self];
    [self.editTableView setDataSource:self];
    [self.editTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    if (_mode == AORegisteredCertificatesTVCModeSign) {
	   [self parseUrl:_startURL];
	   [self.navigationItem setHidesBackButton:YES animated:YES];
    }
    [self.certificatesDescriptionLabel setText: @"certificate_description_label".localized];
    self.title = @"registered_certificates";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadCertificates];
    [self.editTableView reloadData];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setTintColor:THEME_COLOR];
    [self.editTableView setAllowsSelection:_mode == AORegisteredCertificatesTVCModeSign];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _certificatesArray ? _certificatesArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AOCertificateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CertificateCell"];
    
    [cell setCertificateInfo:_certificatesArray[indexPath.row] forEditingCell:self.isEditing];
    [cell setSelectionStyle:_mode == AORegisteredCertificatesTVCModeManagement ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault];
    [cell setAccessoryType:_mode == AORegisteredCertificatesTVCModeManagement ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"remove".localized;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        OSStatus status = [self deleteCertificate:_certificatesArray[indexPath.row]];
        // Se borra el elemento seleccionado del array
        [_certificatesArray removeObjectAtIndex:indexPath.row];
        
        NSString *errorMessage = nil;
        switch (status) {
            case noErr :
            case errSecItemNotFound:
                errorMessage = @"certificate_successfully_deleted".localized;
                break;
            default:
                errorMessage = @"an_error_occurred".localized;
                break;
        }
        
        [CommonAlert createAlertWithTitle: errorMessage message:@"" cancelButtonTitle:OK showOn:self];
        
        [self reloadCertificates];
        [editTableView endUpdates];
        [self.editTableView reloadData];
    }
}

#pragma mark - Certificates

- (void)reloadCertificates
{
    _certificatesArray = nil;
    _certificatesArray = [[OpenSSLCertificateHelper getAddedCertificatesInfo] mutableCopy];
    
    if (!_certificatesArray) {
        _certificatesArray = [[NSMutableArray alloc] init];
    }
}

- (OSStatus)deleteCertificate:(AOCertificateInfo *)certificateInfo
{
    
    OSStatus status = noErr;
    status = [OpenSSLCertificateHelper deleteCertificate:certificateInfo];
    
    return status;
}

#pragma mark - Navigation

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // This method can not be reached because the rows are marked as not selected in the stroyboard.
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    _selectedCertificate = _certificatesArray[selectedIndexPath.row];
    if ([[CertificateUtils sharedWrapper] searchIdentityByName:_selectedCertificate.subject] == YES) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@{kAOUserDefaultsKeyAlias:_selectedCertificate.subject} forKey:kAOUserDefaultsKeyCurrentCertificate];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[CertificateUtils sharedWrapper] setSelectedCertificateName:_selectedCertificate.subject];
        [self performSegueWithIdentifier:@"showSignVC" sender: self];
    }
    else {
        [CommonAlert createAlertWithTitle: @"error_ocurred_while_loading_the_certificate".localized message:@"" cancelButtonTitle:OK showOn:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (_mode == AORegisteredCertificatesTVCModeSign && [segue.identifier isEqualToString:@"showSignVC"]) {
        AOSignViewController *signVC = segue.destinationViewController;
        
        [signVC setParameters:_opParameters];
        [signVC setCertificateName:_selectedCertificate.subject];
        [signVC setBase64UrlSafeCertificateData:[CertificateUtils sharedWrapper].base64UrlSafeCertificateData];
        [signVC setPrivateKey:[CertificateUtils sharedWrapper].privateKey];
    }
}

#pragma mark -
#pragma mark - Inherited methods...
#pragma mark -

/******************************************************************/
/********                  LECTURA DE LA URL                *******/
/******************************************************************/
-(void) parseUrl:(NSString*) urlString
{
    NSDictionary *urlParameters = [CADESSignUtils parseUrl: urlString];
    _opParameters = [urlParameters mutableCopy];
    NSString *datosInUseCert = NULL;
    
    // Check if the operation is certificate selection
    if ([[_opParameters objectForKey:PARAMETER_NAME_OPERATION] isEqualToString: OPERATION_SELECT_CERTIFICATE]) {
        //leemos la url del servlet de almacenamiento
        if([_opParameters objectForKey:PARAMETER_NAME_STSERVLET] != NULL) {
            _stServletCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_STSERVLET]];
        }
        //leemos el identificador del usuario
        if([_opParameters objectForKey:PARAMETER_NAME_ID] != NULL) {
            _idDocCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_ID]];
        }
    } else {
        //Leemos si existen datos en la url
        if([_opParameters objectForKey:PARAMETER_NAME_DAT] != NULL) {
            datosInUseCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_DAT]];
        }
        
        //leemos la url del servlet de almacenamiento
        if([_opParameters objectForKey:PARAMETER_NAME_STSERVLET] != NULL) {
            _stServletCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_STSERVLET]];
        }
        
        //leemos el identificador del usuario
        if([_opParameters objectForKey:PARAMETER_NAME_ID] != NULL) {
            _idDocCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_ID]];
        }
        
        if (datosInUseCert == nil) {
            if([_opParameters objectForKey:PARAMETER_NAME_FILE_ID]!= NULL)
                _fileIdCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_FILE_ID]];
            if(_fileIdCert == nil){
                //Notificamos del error al servidor si es posible
                NSString *errorToSend = @"";
                errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
                errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA];
                
                if(_stServletCert != NULL & _idDocCert != NULL)
                    [self errorReportAsync:errorToSend];
			 NSLog(@"ERROR: %@", errorToSend);
                [CommonAlert createAlertWithTitle: @"error".localized message: @"no_datos_firmar".localized cancelButtonTitle: @"cerrar".localized showOn:self];
                [self.editTableView setAllowsSelection:NO];
            } else {
                if([_opParameters objectForKey:PARAMETER_NAME_RTSERVLET]!= NULL) {
                    _rtServletCert = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_RTSERVLET]];
                }
                if([_opParameters objectForKey:PARAMETER_NAME_CIPHER_KEY]!= NULL) {
                    _cipherKeyCert  = [[NSString alloc] initWithString:[_opParameters objectForKey:PARAMETER_NAME_CIPHER_KEY]];
                }
                if(_cipherKeyCert != NULL && _rtServletCert != NULL) {
                    [self loadDataFromRtservlet];
                }
                else {
                    //Notificamos del error al servidor si es posible
                    NSString *errorToSend = @"";
                    errorToSend = [errorToSend stringByAppendingString:ERROR_MISSING_DATA];
                    errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
                    errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_MISSING_DATA];
                    
                    if(_stServletCert != NULL & _idDocCert != NULL) {
                        [self errorReportAsync:errorToSend];
                    }
                    [CommonAlert createAlertWithTitle: @"error".localized message: @"no_datos_firmar".localized cancelButtonTitle: @"cerrar".localized showOn:self];
                    [self.editTableView setAllowsSelection:NO];
                }
            }
        }
    }
    
}

/**
 Método que notifica de un error en la aplicación al servidor de guardado de firmas "storage" de forma síncrona.
 
 parámetros:
 -----------
 dataSign: error producido.
 
 */
-(void) errorReportAsync:(NSString*) error
{
    if(_stServletCert!=NULL && _idDocCert != NULL){
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
        post = [post stringByAppendingString:_idDocCert];
        post = [post stringByAppendingString:HTTP_AND];
        post = [post stringByAppendingString:PARAMETER_NAME_DAT];
        post = [post stringByAppendingString:HTTP_EQUALS];
        post = [post stringByAppendingString:error];
        
        //Codificamos la url de post
        //Changed NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", (int) [postData length]];
        
        // Obtenemos la URL del servidor de la pantalla de preferencias
        NSURL* requestUrl = [[NSURL alloc] initWithString:_stServletCert];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
        [request setHTTPMethod:POST];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
        [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];
        [request setHTTPBody:postData];
                
        //realizamos la llamada al servidor.
        //NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        _reportErrorCert = true;
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [connection start];
    }
}

/**
 Método que obtiene los datos de trabajo desde el servidor intermedio.
 
 */
-(void) loadDataFromRtservlet
{
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
    post = [post stringByAppendingString:_fileIdCert];
    
    //Codificamos la url de post
    //CHANGED NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", (int) [postData length]];
    
    // Obtenemos la URL del servidor de la pantalla de preferencias
    NSURL* requestUrl = [[NSURL alloc] initWithString:_rtServletCert];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [request setHTTPMethod:POST];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"text/plain,text/html,application/xhtml+xml,application/xml" forHTTPHeaderField:@"Accept"];

    //This is needed because the server needs time to upload the data

    [request setHTTPBody:postData];
    
    
    _retrievingDataFromServletCert = true;
    
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

/* METODOS DONDE SE RECIBE LA RESPUESTA DE LA CONEXION ASÍNCRONA */
/**
 Método donde se recibe la respuesta de la petición asíncrona.
 
 parámetros:
 -----------
 didReceiveData: Conexión establecida asíncrona.
 data:           Datos recibidos del servidor.
 */

NSMutableData *receivedDataCert = NULL;
NSString *receivedStringCert = NULL;

//los datos van llegando por "rafagas". Lo que hay que ir haciendo es ir juntandolos todos.
-(void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    // Append the new data to the receivedData.
    [receivedDataCert appendData:data];
}

//Se confirma la respuesta. aprovechamos para inicializar los datos de respuesta
-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    // Discard all previously received data.
    
    receivedDataCert = [[NSMutableData alloc] init];
}

//cuando se ha terminado de leer los datos recibidos, terminamos ya la conexion y se pasa a la prefirma.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Connection succeeded in downloading the request.
    // Convert received data into string.
    //Changed receivedStringCert = [[NSString alloc] initWithData:receivedDataCert encoding:NSASCIIStringEncoding];
    receivedStringCert = [[NSString alloc] initWithData:receivedDataCert
                                               encoding:NSUTF8StringEncoding];
    
    if (_retrievingDataFromServletCert){
        
        _retrievingDataFromServletCert=false;
        
        //Obtenemos la respuesta del servidor.
        NSString* responseString = [[NSString alloc] initWithData:receivedDataCert encoding:NSUTF8StringEncoding];
	   if (!self.alertpb) {
		  self.alertpb = [[AlertProgressBar alloc]init];
		  [self.alertpb createProgressBarWithMessage: @"processing_web_data".localized];
	   }
	   if ([self.navigationController.visibleViewController isKindOfClass:[UIAlertController class]]) {
		  [self decodeData:responseString];
	   } else {
		  [self.alertpb destroy:^{
			 [self presentViewController:self.alertpb.av animated:true completion:^{
				[self.alertpb.spinner startAnimating];
				[self decodeData:responseString];
			 }];
		  }];
	   }
	   
    }
    // la respuesta a un reporte de error
    else if(_reportErrorCert){
        _reportErrorCert = false;
    }
    
    // release the connection, and the data object
}

-(void) decodeData: (NSString *)responseString {
    @try {
	   NSData *decoded = [DesCypher decypherData:responseString sk:[self->_cipherKeyCert dataUsingEncoding:NSUTF8StringEncoding]];
	   NSLog(@"RESPONSE STRING: %@", responseString);
	   if ([responseString hasPrefix:@"ERR-06"] && self.numberOfRetries<3){
		  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
			 [self parseUrl: self->_startURL];
			 self.numberOfRetries = self.numberOfRetries + 1;
		  });
	   } else {
		  NSString* datosInUse = [[NSString alloc] initWithData:decoded encoding:NSUTF8StringEncoding];
		  
		  datosInUse = [datosInUse stringByRemovingPercentEncoding];
		  
		  AOEntity *entidad = [[AOEntity alloc] init];
		  AOXMLReader *xmlReader = [[AOXMLReader alloc] init];
		  entidad = [xmlReader loadXMLByString:datosInUse ];
		  
		  if(entidad.datField != NULL) {
			 [self->_opParameters setObject:entidad.datField forKey:PARAMETER_NAME_DAT];
		  }
		  
		  if(entidad.formatField != NULL) {
			 [self->_opParameters setObject:entidad.formatField forKey:PARAMETER_NAME_FORMAT];
		  }
		  
		  if(entidad.algorithmField != NULL) {
			 [self->_opParameters setObject:entidad.algorithmField forKey:PARAMETER_NAME_ALGORITHM2];
		  }
		  
		  if(entidad.propertiesField != NULL) {
			 [self->_opParameters setObject:entidad.propertiesField forKey:PARAMETER_NAME_PROPERTIES];
		  }
		  
		  if(entidad.idField != NULL) {
			 [self->_opParameters setObject:entidad.idField forKey:PARAMETER_NAME_ID];
		  }
		  
		  if(entidad.stServletField != NULL) {
			 [self->_opParameters setObject: entidad.stServletField forKey:PARAMETER_NAME_STSERVLET];
		  }
		  
		  if (self.alertpb) {
			 [self.alertpb destroy];
		  }
	   }
    }
    @catch (NSException *exception) {
	   if (self.alertpb) {
		  [self.alertpb destroy];
	   }
    }
}

/**************************/
/*** PROTECCIONES SSL ****/
/**************************/

//para las protecciones ssl
//Acepta todas las conexiones ssl
-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
}

/**
 Método donde se procesan los errores de conexión con el servidor.
 
 parámetros:
 -----------
 connection:        Conexión establecida asíncrona.
 didFailWithError:  Error producido.
 */
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // Liberar la conexión
    
    //Notificamos del error al servidor
    NSString *errorToSend = @"";
    errorToSend = [errorToSend stringByAppendingString:ERROR_SIGNING];
    errorToSend = [errorToSend stringByAppendingString:ERROR_SEPARATOR];
    errorToSend = [errorToSend stringByAppendingString:DESC_ERROR_SIGNING];
    
    [self errorReportAsync:errorToSend];
    
    return;
}

@end
