//
//  AOAcercadeViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOAcercadeViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet UIButton *masInfoButton;
@property (strong, nonatomic) IBOutlet UILabel *aboutTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *aboutDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *howToInstallCertificatesTitle;
-(IBAction)buttonPressed:(id)sender;
@end
