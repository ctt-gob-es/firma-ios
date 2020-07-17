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
    [self.aboutTitleLabel setText: @"about_title_label".localized];
    [self.aboutDescriptionLabel setText:[NSString stringWithFormat: @"about_description_label".localized,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    [self.howToInstallCertificatesTitle setText: @"how_to_install_certificates_title".localized];
    [self.iTunesInstructionsLabel setText: @"iTunes_instructions_label".localized];
    [self.certificateInstructionsLabel setText: @"certificate_instructions_label".localized];
    [self.masInfoButton setTitle: @"more_info_button".localized forState:UIControlStateNormal];
    [self fillTextForFrequentlyAskedQuestionsTitleLabel];
    self.aboutNavigationItem.title = @"about_navigation_title".localized;;
    self.howToNavigationItem.title = @"how_to_navigation_title".localized;
    self.questionsNavigationItem.title = @"questions_navigation_title".localized;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.aboutDescriptionLabel setContentOffset:CGPointZero animated:NO];
    [self.frequentlyAskedQuestionsDescriptionLabel setContentOffset:CGPointZero animated:NO];
}

-(void)fillTextForFrequentlyAskedQuestionsTitleLabel{
    [self.frequentlyAskedQuestionsTitleLabel setText: @"frequently_asked_questions_title_label".localized];
    NSString* string1 = @"frequently_asked_questions_description_label_1".localized;
    NSString* string2 = @"frequently_asked_questions_description_label_2".localized;
    NSString* string3 = @"frequently_asked_questions_description_label_3".localized;
    NSString* string4 = @"frequently_asked_questions_description_label_4".localized;
    NSString* string5 = @"frequently_asked_questions_description_label_5".localized;
    NSString* string6 = @"frequently_asked_questions_description_label_6".localized;
    NSString* string7 = @"frequently_asked_questions_description_label_7".localized;
    NSString* string8 = @"frequently_asked_questions_description_label_8".localized;
    NSString* frequentlyAskedQuestionsDescriptionLabelString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",string1,string2,string3,string4,string5,string6,string7,string8];
    self.frequentlyAskedQuestionsDescriptionLabel.text = frequentlyAskedQuestionsDescriptionLabelString;
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string1];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string3];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string5];
    [self.frequentlyAskedQuestionsDescriptionLabel boldSubstring: string7];
}

-(IBAction)buttonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"url_forja".localized]];
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
