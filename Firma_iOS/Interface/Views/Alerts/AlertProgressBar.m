//
//  AlertProgressBar.m
//  Firma_iOS
//
//

#import "AlertProgressBar.h"

@implementation AlertProgressBar

@synthesize av;
@synthesize spinner;

- (void) createProgressBar:(UIView*)view{
    av = [UIAlertController alertControllerWithTitle: NSLocalizedString(@"processing",nil) message:@"" preferredStyle:UIAlertControllerStyleAlert];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(140, 70);
    spinner.hidesWhenStopped = YES;
    [spinner startAnimating];
    [av.view addSubview:spinner];
    [[self currentTopViewController] presentViewController:av animated:YES completion:nil];
}

-(void) destroy {
    [spinner stopAnimating];
    [[self currentTopViewController] dismissViewControllerAnimated:true completion:nil];
}

- (UIViewController *)currentTopViewController
{
    UIViewController *topVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (topVC.presentedViewController)
    {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

@end
