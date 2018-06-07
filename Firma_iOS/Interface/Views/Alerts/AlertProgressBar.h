//
//  AlertProgressBar.h
//  Firma_iOS
//
//

#import <Foundation/Foundation.h>

@interface AlertProgressBar : NSObject

@property (nonatomic, strong) UIAlertController *av;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

-(void) createProgressBar:(UIView*)view;
-(void) destroy;

@end
