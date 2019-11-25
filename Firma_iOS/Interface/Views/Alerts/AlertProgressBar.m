//
//  AlertProgressBar.m
//  Firma_iOS
//
//

#import "AlertProgressBar.h"

@implementation AlertProgressBar

@synthesize av;
@synthesize spinner;

- (void) createAndShowProgressBar:(UIViewController*)viewController withMessage: (NSString *) message {
    av = [UIAlertController alertControllerWithTitle: message message:@"" preferredStyle:UIAlertControllerStyleAlert];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(140, 70);
    spinner.hidesWhenStopped = YES;
    [spinner startAnimating];
    [av.view addSubview:spinner];
    [viewController presentViewController:av animated:true completion:nil];
}

-(void) createProgressBarWithMessage: (NSString *) message {
    av = [UIAlertController alertControllerWithTitle: message message:@"" preferredStyle:UIAlertControllerStyleAlert];
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	spinner.center = CGPointMake(140, 70);
	spinner.hidesWhenStopped = YES;
	[av.view addSubview:spinner];
}

-(void) destroy {
    [self destroy:nil];
}

-(void) destroy:(void(^)(void))onComplete {
    [spinner stopAnimating];
    [av dismissViewControllerAnimated:true completion:^{
        if (onComplete != nil) {
            onComplete();
        }
    }];
}

@end
