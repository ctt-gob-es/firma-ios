//
//  AOHelpMenuViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOHelpMenuViewController : GAITrackedViewController <UITableViewDelegate>{
    IBOutlet UITableView *tblViewHelp;
}


@property (retain, nonatomic) IBOutlet UITableView *tblViewHelp;

@end
