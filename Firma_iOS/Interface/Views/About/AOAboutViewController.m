//
//  AOAboutViewController.m
//  Firma_iOS
//
//

#import "AOAboutViewController.h"
#import "AORegisteredCertificatesTVC.h"
#import "CADESConstants.h"
#import "ColorChart.h"
#import "GlobalConstants.h"

@interface AOAboutViewController ()

@end

@implementation AOAboutViewController

NSString *startUrlIncoming = NULL;
BOOL isURL = NO;

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.

    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barTintColor = NAVIGATION_BAR_COLOR;
    [self createNotification];
    
    self.screenName = @"IOS AOAboutViewController - Main window";
    [self.homeDescriptionLabel setText:[NSString stringWithFormat: @"home_description_label".localized,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    self.homeDescriptionLabel.scrollEnabled = NO;
    [self.homeFooterLabel setText:[NSString stringWithFormat: @"home_footer_label".localized,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    self.keystoreManagerBarItem.title = @"keystore_manager_bar_item".localized;
    self.helpBarItem.title = @"help_bar_item".localized;
    self.homeNavitationItem.title = @"home_title".localized;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) createNotification {
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(onReadUrl:)
     name:URL_READED
     object:nil
     ];
}

-(void) onReadUrl:(NSNotification*) notification {

    isURL = YES;
    NSString *url = [notification object];
    
    //pasar al segue
    startUrlIncoming = url;    
    
    //Nos desplazamos a la pantalla de seleccion de pkcs12.
    @try {
        
        [self performSegueWithIdentifier:@"showStoredCertificatesToSign" sender:self];
    }
    @catch (NSException *e) {
        // Se ignora
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showStoredCertificatesToSign"]) { 
        // Get destination view
        AORegisteredCertificatesTVC *registeredCertificatesTVC = [segue destinationViewController];
        [registeredCertificatesTVC setMode:AORegisteredCertificatesTVCModeSign];
        [registeredCertificatesTVC setStartURL:startUrlIncoming];
    }
    
    if ([[segue identifier] isEqualToString:@"showStoredCertificatesToManage"]) {
        
        // Get destination view
        AORegisteredCertificatesTVC *registeredCertificatesTVC = [segue destinationViewController];
        [registeredCertificatesTVC setMode:AORegisteredCertificatesTVCModeManagement];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
  
    if(item.tag == 0){
        //Nos desplazamos a la pantalla de ayuda
        @try {
            [self performSegueWithIdentifier:@"toHelpScreen" sender:self];
        }
        @catch (NSException *e) {
            // Se ignora
        }
    }
    else
    {
        //Nos desplazamos a la pantalla de seleccion de almacenes
        @try {
            [self performSegueWithIdentifier:@"showStoredCertificatesToManage" sender:self];
        }
        @catch (NSException *e) {
            // Se ignora
        }
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:URL_READED object:nil];
}

@end
