//
//  AOAboutViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOAboutViewController : GAITrackedViewController <UITabBarControllerDelegate> {
    
    IBOutlet UITabBar *tabBar;
    NSString *relinkUserId;
}

@property (strong, nonatomic) IBOutlet UIButton *manageStoreButton;
@property (nonatomic, strong) NSNotification *onReadUrl;
@property (strong, nonatomic) IBOutlet UITextView *homeDescriptionLabel;

-(void)createNotification;

@end
