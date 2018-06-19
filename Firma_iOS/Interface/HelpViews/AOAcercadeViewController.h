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
-(IBAction)buttonPressed:(id)sender;
@end
