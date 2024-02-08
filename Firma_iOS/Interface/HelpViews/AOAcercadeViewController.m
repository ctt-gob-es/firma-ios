    //
    //  AOAcercadeViewController.m
    //  Firma_iOS
    //
    //

#import "AOAcercadeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UITextView+Boldify.h"
#import "UIFont+Utils.h"
#import "NSMutableAttributedString+Extension.h"

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
    self.screenName = @"IOS AOAboutViewController - Help Screen";
    [self.aboutTitleLabel setText: @"about_title_label".localized];
    
        // About description label
    [self.aboutDescriptionLabel setAttributedText:[self getAboutDescriptionText]];
    
    [self.howToInstallCertificatesTitle setText: @"how_to_install_certificates_title".localized];
    [self.iTunesInstructionsLabel setText: @"iTunes_instructions_label".localized];
    [self.certificateInstructionsLabel setText: @"certificate_instructions_label".localized];
    
        // More info button
    NSMutableAttributedString *moreInfoButtonText = @"more_info_button".localized.linkStyle;
    [moreInfoButtonText addExternalLinkIcon:self.masInfoButton.titleLabel.font];
    [self.masInfoButton setAttributedTitle: moreInfoButtonText forState:UIControlStateNormal];
    
    [self fillTextForFrequentlyAskedQuestionsTitleLabel];
    self.aboutNavigationItem.title = @"about_navigation_title".localized;
    self.howToNavigationItem.title = @"how_to_navigation_title".localized;
    self.questionsNavigationItem.title = @"questions_navigation_title".localized;
    
        // Logo
    self.logo.accessibilityLabel = @"logo".localized;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.aboutDescriptionLabel setContentOffset:CGPointZero animated:NO];
    [self.frequentlyAskedQuestionsDescriptionLabel setContentOffset:CGPointZero animated:NO];
}

- (NSMutableAttributedString *) getAboutDescriptionText {
    UIFont *aboutDescriptionFont = [UIFont systemFontOfSize:13.5];
    NSMutableAttributedString *aboutDescriptionAttributedString = [[NSMutableAttributedString alloc] init];
    
        // 1st paragraph
    NSString *aboutDescription1 = [NSString stringWithFormat: @"about_description_label_1".localized,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSMutableAttributedString *aboutDescriptionAttributedString1 = [aboutDescription1 getHtml:aboutDescriptionFont];
    [aboutDescriptionAttributedString appendAttributedString:aboutDescriptionAttributedString1];
    
        // 2nd paragraph
    NSString *aboutDescription2 = [NSString stringWithFormat: @"%@", @"about_description_label_2".localized];
    NSMutableAttributedString *aboutDescriptionAttributedString2 = [aboutDescription2 getHtml:aboutDescriptionFont];
        // Add external link icon
    [aboutDescriptionAttributedString2 addExternalLinkIcon:aboutDescriptionFont];
    [aboutDescriptionAttributedString appendAttributedString:aboutDescriptionAttributedString2];
    
        // 3rd paragraph
    NSString *aboutDescription3 = [NSString stringWithFormat: @"%@", @"about_description_label_3".localized];
    NSMutableAttributedString *aboutDescriptionAttributedString3 = [aboutDescription3 getHtml:aboutDescriptionFont];
        // Add external link icon
    [aboutDescriptionAttributedString3 addExternalLinkIcon:aboutDescriptionFont];
    [aboutDescriptionAttributedString appendAttributedString:aboutDescriptionAttributedString3];
    
        // 4th paragraph
    NSString *aboutDescription4 = [NSString stringWithFormat: @"%@", @"about_description_label_4".localized];
    NSMutableAttributedString *aboutDescriptionAttributedString4 = [aboutDescription4 getHtml:aboutDescriptionFont];
        // Add external link icon
    [aboutDescriptionAttributedString4 addExternalLinkIcon:aboutDescriptionFont];
    [aboutDescriptionAttributedString appendAttributedString:aboutDescriptionAttributedString4];
    return aboutDescriptionAttributedString;
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
    self.frequentlyAskedQuestionsDescriptionLabel.font = [[UIFont alloc] mediumSystemFontScaled];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

@end
