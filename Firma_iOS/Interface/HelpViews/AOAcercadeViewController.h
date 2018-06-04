//
//  AOAcercadeViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOAcercadeViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet UIButton *masInfoButton;
-(IBAction)buttonPressed:(id)sender;
@end
