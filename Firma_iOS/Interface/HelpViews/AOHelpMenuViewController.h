    //
    //  AOHelpMenuViewController.h
    //  Firma_iOS
    //
    //

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOHelpMenuViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet UITextView *helpMenuDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *helpMenuTitle;
@property (strong,nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIView *optionsView;
@property (weak, nonatomic) IBOutlet UIView *firstOption;
@property (weak, nonatomic) IBOutlet UIView *secondOption;
@property (weak, nonatomic) IBOutlet UIView *thirdOption;
@property (weak, nonatomic) IBOutlet UIView *fourthOption;
@property (weak, nonatomic) IBOutlet UIView *fifthOption;

@end
