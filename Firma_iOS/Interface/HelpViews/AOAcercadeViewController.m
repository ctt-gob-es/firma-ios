//
//  AOAcercadeViewController.m
//  Firma_iOS
//
//

#import "AOAcercadeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UITextView+Boldify.h"

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
    [self.aboutDescriptionLabel setText:[NSString stringWithFormat:NSLocalizedString(@"about_description_label", nil),[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    [self.howToInstallCertificatesTitle setText:NSLocalizedString(@"how_to_install_certificates_title", nil)];
    [self.iTunesInstructionsLabel setText:NSLocalizedString(@"iTunes_instructions_label", nil)];
    [self.certificateInstructionsLabel setText:NSLocalizedString(@"certificate_instructions_label", nil)];
    [self.masInfoButton setTitle:NSLocalizedString(@"more_info_button", nil) forState:UIControlStateNormal];
    [self fillTextForFrequentlyAskedQuestionsTitleLabel];
    self.aboutNavigationItem.title = NSLocalizedString(@"about_navigation_title", nil);;
    self.howToNavigationItem.title = NSLocalizedString(@"how_to_navigation_title", nil);
    self.questionsNavigationItem.title = NSLocalizedString(@"questions_navigation_title", nil);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.aboutDescriptionLabel setContentOffset:CGPointZero animated:NO];
    [self.frequentlyAskedQuestionsDescriptionLabel setContentOffset:CGPointZero animated:NO];
}

-(void)fillTextForFrequentlyAskedQuestionsTitleLabel{
    [self.frequentlyAskedQuestionsTitleLabel setText:NSLocalizedString(@"frequently_asked_questions_title_label", nil)];
    NSString* string1 = NSLocalizedString(@"frequently_asked_questions_description_label_1", nil);
    NSString* string2 = NSLocalizedString(@"frequently_asked_questions_description_label_2", nil);
    NSString* string3 = NSLocalizedString(@"frequently_asked_questions_description_label_3", nil);
    NSString* string4 = NSLocalizedString(@"frequently_asked_questions_description_label_4", nil);
    NSString* string5 = NSLocalizedString(@"frequently_asked_questions_description_label_5", nil);
    NSString* string6 = NSLocalizedString(@"frequently_asked_questions_description_label_6", nil);
    NSString* string7 = NSLocalizedString(@"frequently_asked_questions_description_label_7", nil);
    NSString* string8 = NSLocalizedString(@"frequently_asked_questions_description_label_8", nil);
    NSString* frequentlyAskedQuestionsDescriptionLabelString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",string1,string2,string3,string4,string5,string6,string7,string8];
    self.frequentlyAskedQuestionsDescriptionLabel.text = frequentlyAskedQuestionsDescriptionLabelString;
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string1];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string3];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string5];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string7];
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

@end
