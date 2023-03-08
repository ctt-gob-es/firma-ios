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
@property (strong, nonatomic) IBOutlet UILabel *homeFooterLabel;
@property (strong, nonatomic) IBOutlet UITabBarItem *keystoreManagerBarItem;
@property (strong, nonatomic) IBOutlet UITabBarItem *helpBarItem;
@property (strong, nonatomic) IBOutlet UINavigationItem *homeNavitationItem;

@end
