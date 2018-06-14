//
//  AlertProgressBar.m
//  Firma_iOS
//
//

#import "AlertProgressBar.h"

@implementation AlertProgressBar

@synthesize av;
@synthesize spinner;

- (void) createProgressBar:(UIViewController*)viewController {
    av = [UIAlertController alertControllerWithTitle: NSLocalizedString(@"processing",nil) message:@"" preferredStyle:UIAlertControllerStyleAlert];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(140, 70);
    spinner.hidesWhenStopped = YES;
    [spinner startAnimating];
    [av.view addSubview:spinner];
    [viewController presentViewController:av animated:true completion:nil];
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
