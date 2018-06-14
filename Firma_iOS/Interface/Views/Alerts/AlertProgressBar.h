//
//  AlertProgressBar.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>

@interface AlertProgressBar : NSObject

@property (nonatomic, strong) UIAlertController *av;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

-(void) createProgressBar:(UIViewController*)viewController;
-(void) destroy;
-(void) destroy:(void(^)(void))onComplete;

@end
