//
//  AOSignViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "BatchSignUseCase.h"

@interface AOSignViewController : GAITrackedViewController<BatchSignUseCaseDelegate>
@property (strong, nonatomic) IBOutlet UILabel *nombreCert;
@property (strong, nonatomic) IBOutlet UIButton *signButton;

@property (nonatomic, strong) NSDictionary *parameters;
@property(nonatomic, strong) NSString *certificateName;
@property(nonatomic, strong) NSString *base64UrlSafeCertificateData;
@property (strong, nonatomic) IBOutlet UITextView *signCertificateSelectorLabel;
@property (strong, nonatomic) IBOutlet UITextView *signCertificateDescriptionLabel;

@property(nonatomic, strong) BatchSignUseCase *useCase;
-(void)setPrivateKey:(SecKeyRef) thePrivateKey;

@end
