//
//  AOSignViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOSignViewController : GAITrackedViewController < UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *nombreCert;
@property (strong, nonatomic) IBOutlet UIButton *signButton;

@property (nonatomic, strong) NSDictionary *parameters;
@property(nonatomic, strong) NSString *certificateName;
@property(nonatomic, strong) NSString *base64UrlSafeCertificateData;

-(void)setPrivateKey:(SecKeyRef) thePrivateKey;

@end
