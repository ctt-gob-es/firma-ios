//
//  AOCertificateSelectionViewController.h
//  Firma_iOS
//
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface AOCertificateSelectionViewController : GAITrackedViewController <UITableViewDelegate>{
        IBOutlet UITableView *tblView;
        IBOutlet UIButton *selectionButton;
}

@property (strong, nonatomic) IBOutlet UITableView *tblView;
@property (nonatomic, strong) UIButton *selectionButton;
@property (nonatomic, strong) NSString *startUrl;
@property (nonatomic, strong) NSDictionary *parameters;

@end
