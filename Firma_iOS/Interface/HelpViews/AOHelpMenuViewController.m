    //
    //  AOHelpMenuViewController.m
    //  Firma_iOS
    //
    //

#import "AOHelpMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "NSMutableAttributedString+Extension.h"
#import "AOHelpCell.h"
#import "GlobalConstants.h"
#import "UIFont+Utils.h"
#import "AOHelpOptionView.h"

@interface AOHelpMenuViewController ()

@end

@implementation AOHelpMenuViewController


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
    
    self.screenName = @"IOS AOHelpMenuViewController - Help menu";
    
        // Logo
    self.logo.accessibilityLabel = @"logo".localized;
    
        // Help menu
    [self.helpMenuTitle setText: @"help_menu_title".localized];
    self.title = @"help".localized ;
    
        // Help options
    [self configureHelpOptions];
    
        // Help menu description
    UIFont *helpMenuDescriptionFont = [UIFont systemFontOfSize:14];
    NSMutableAttributedString *helpMenuDescriptionAttributedString = [@"help_menu_description_label".localized getHtml:helpMenuDescriptionFont];
    [helpMenuDescriptionAttributedString addExternalLinkIcon:helpMenuDescriptionFont];
    [helpMenuDescriptionAttributedString align:NSTextAlignmentCenter];
    [self.helpMenuDescriptionLabel setAttributedText:helpMenuDescriptionAttributedString];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}


- (IBAction)goBackHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

    // Method to configure the available help options
- (void) configureHelpOptions {
        // Options view
        // Border
    self.optionsView.layer.borderWidth = 1;
    self.optionsView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.optionsView.layer.cornerRadius =  6.0f;
    
        // Configure each option
    UIFont *optionsFont = [[UIFont alloc] mediumSystemFontScaled];
        // First option
    [self configureHelpOption:self.firstOption text:@"help_acercade" font:optionsFont action:@selector(firstHelpOptionSelector)];
        // Second option
    [self configureHelpOption:self.secondOption text:@"help_instalar_certificados" font:optionsFont action:@selector(secondHelpOptionSelector)];
        // Third option
    [self configureHelpOption:self.thirdOption text:@"help_preguntas" font:optionsFont action:@selector(thirdHelpOptionSelector)];
        // Fourth option
    [self configureHelpOption:self.fourthOption text:@"privacy_policy" font:optionsFont action:@selector(fourthHelpOptionSelector)];
        // Fifth option
    [self configureHelpOption:self.fifthOption text:@"accesibility_statement" font:optionsFont action:@selector(fifthHelpOptionSelector)];
}

    // Method to configure each available option
- (void) configureHelpOption:(UIView *)view text:(NSString *)text font:(UIFont *)textFont action:(SEL)selector {
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    
    AOHelpOptionView *option = (AOHelpOptionView *)view;
    [option configureOption:text.localized font:textFont];
    [option addGestureRecognizer:tapGestureRecognizer];
}


    // Method that sets the action for the first help option
- (void)firstHelpOptionSelector
{
        // Go to About Screen
    UIViewController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutScreen"];
    [self.navigationController pushViewController:destinationController animated:YES];
}

    // Method that sets the action for the second help option
- (void)secondHelpOptionSelector
{
        // Go to Certificate Installation Screen
    UIViewController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"CertificateInstallationScreen"];
    [self.navigationController pushViewController:destinationController animated:YES];
}

    // Method that sets the action for the third help option
- (void)thirdHelpOptionSelector
{
        // Go to Frequently Questions Screen
    UIViewController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"FrequentlyQuestionsScreen"];
    [self.navigationController pushViewController:destinationController animated:YES];
}

    // Method that sets the action for the fourth help option
- (void)fourthHelpOptionSelector
{
        // Open privacy policy
    NSURL* privacyPolicyUrl = [NSURL URLWithString: @"url_privacy_policy".localized];
    if( [[UIApplication sharedApplication] canOpenURL:privacyPolicyUrl])
        [[UIApplication sharedApplication] openURL:privacyPolicyUrl options:@{} completionHandler:nil];
}

    // Method that sets the action for the fifth help option
- (void)fifthHelpOptionSelector
{
        // Open accesibility statement
    NSURL* accesibiltyUrl = [NSURL URLWithString: @"url_accessibility_statement".localized];
    if( [[UIApplication sharedApplication] canOpenURL:accesibiltyUrl])
        [[UIApplication sharedApplication] openURL:accesibiltyUrl options:@{} completionHandler:nil];
}

@end
