//
//  AlertProgressBar.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>

@interface AlertProgressBar : NSObject

@property (nonatomic, strong) UIAlertController *av;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

- (void) createAndShowProgressBar:(UIViewController*)viewController withMessage: (NSString *) message;
-(void) createProgressBarWithMessage: (NSString *) message;
-(void) destroy;
-(void) destroy:(void(^)(void))onComplete;

@end
