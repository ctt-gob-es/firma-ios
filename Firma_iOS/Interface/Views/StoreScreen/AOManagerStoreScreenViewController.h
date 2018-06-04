//
//  AOManagerStoreScreenViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOManagerStoreScreenViewController : GAITrackedViewController <UITableViewDelegate>{    
    NSString *relinkUserId;
    IBOutlet UITableView *tblViewManager;
    IBOutlet UIButton *deleteButton;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblViewManager;
@property (strong, nonatomic) NSMutableArray *tableDataManager;
-(IBAction)deleteButtonPressed:(id)sender;

@end

