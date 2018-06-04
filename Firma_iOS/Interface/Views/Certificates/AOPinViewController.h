//
//  AOPinViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOPinViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet UITextView *nombreCert;

@property (strong, nonatomic) IBOutlet UITextField *pinTextField;

@property (strong, nonatomic) IBOutlet UIButton *pinButton;
-(IBAction)pinButtonPressed:(id)sender;

@property(nonatomic, strong) NSString *nombreCertInUse;

@property(nonatomic, strong) NSString *pkcs12Path;

@property(nonatomic, strong) NSString *base64UrlSafeCertificateData;

@property(nonatomic, strong) NSString *certificateName;

@property (nonatomic, strong) NSDictionary *parameters;


@end
