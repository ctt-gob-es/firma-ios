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
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:av animated:true completion:nil];}

-(void) destroy {
    [spinner stopAnimating];
        [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissViewControllerAnimated:true completion:nil];
}

@end
