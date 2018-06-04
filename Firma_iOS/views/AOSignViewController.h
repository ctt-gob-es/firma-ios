//
//  AOSignViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOSignViewController : GAITrackedViewController < UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UILabel *nombreCert;
@property (retain, nonatomic) IBOutlet UIButton *signButton;

@property (nonatomic, retain) NSDictionary *parameters;
@property(nonatomic, retain) NSString *certificateName;
@property(nonatomic, retain) NSString *base64UrlSafeCertificateData;

-(void)setPrivateKey:(SecKeyRef) thePrivateKey;

@end
