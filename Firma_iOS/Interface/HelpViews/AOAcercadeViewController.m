//
//  AOAcercadeViewController.m
//  Firma_iOS
//
//

#import "AOAcercadeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AOAcercadeViewController ()

@end

@implementation AOAcercadeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onGoingToBackGround:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    self.screenName = @"IOS AOAboutViewController - Help Screen";
    [self.aboutTitleLabel setText:NSLocalizedString(@"about_title_label", nil)];
    [self.aboutDescriptionLabel setText:NSLocalizedString(@"about_description_label", nil)];
    [self.howToInstallCertificatesTitle setText:NSLocalizedString(@"how_to_install_certificates_title", nil)];
    [self.iTunesInstructionsLabel setText:NSLocalizedString(@"iTunes_instructions_label", nil)];
    [self.certificateInstructionsLabel setText:NSLocalizedString(@"certificate_instructions_label", nil)];
    [self.masInfoButton setTitle:NSLocalizedString(@"more_info_button", nil) forState:UIControlStateNormal];
}

-(IBAction)buttonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: NSLocalizedString(@"url_forja",nil)]];
}

- (IBAction)didClickBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//cuando se pulsa el botón del centro
-(void)onGoingToBackGround:(NSNotification*) notification {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMasInfoButton:nil];
    [super viewDidUnload];
}
@end
