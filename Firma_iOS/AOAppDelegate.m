    //
    //  AOAppDelegate.m
    //  Firma_iOS
    //

#import "AOAppDelegate.h"
#import "GAI.h"
#import "GlobalConstants.h"
#import "UIFont+Utils.h"
#import "Cliente__firma-Swift.h"
#import "AONSBundle+Language.h"

@implementation AOAppDelegate

NSString *URLString, *state = @"Inactive";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    if (@available(iOS 15, *)) {
            // MARK: Navigation bar appearance
        UINavigationBarAppearance *navigationBarAppearance = [UINavigationBarAppearance alloc];
        [navigationBarAppearance configureWithOpaqueBackground];
        navigationBarAppearance.titleTextAttributes = @{
            NSForegroundColorAttributeName : UIColor.blackColor
        };
        navigationBarAppearance.backgroundColor = UIColor.whiteColor;
        [UINavigationBar appearance].standardAppearance = navigationBarAppearance;
        [UINavigationBar appearance].compactAppearance = navigationBarAppearance;
        [UINavigationBar appearance].scrollEdgeAppearance = navigationBarAppearance;
    }
    
        // FONTS
    UIFont *genericFont = [[UIFont alloc] mediumSystemFontScaled];
        // TextView
    [UITextView appearance].font = genericFont;
        // Label
    [UILabel appearance].font = genericFont;
    [[UILabel appearance] setNumberOfLines: 0];
    [[UILabel appearance] setLineBreakMode:NSLineBreakByWordWrapping];
    
    /*    // Optional: automatically send uncaught exceptions to Google Analytics.
     [GAI sharedInstance].trackUncaughtExceptions = YES;
     
     // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
     [GAI sharedInstance].dispatchInterval = 20;
     
     // Optional: set Logger to VERBOSE for debug information.
     [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
     
     // Initialize tracker.
     [[GAI sharedInstance] tr<ackerWithTrackingId:@"UA-41615516-1"];*/
    
    NSString *savedLanguage = [[NSUserDefaults standardUserDefaults] stringForKey:@"appLanguage"];
	   if (savedLanguage) {
		  [NSBundle setLanguage:savedLanguage];
	   } else {
		  // Configurar el idioma por defecto basado en el idioma del sistema
		  NSString *defaultLanguage = [[NSLocale preferredLanguages] firstObject];
		  [NSBundle setLanguage:defaultLanguage];
	   }
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"can"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self decideController];
    
    return YES;
}

- (void)decideController {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL privacyAccepted = [defaults boolForKey:@"user_privacy_accepted"];
    
    UIViewController *rootViewController;
    if ([defaults objectForKey:@"user_privacy_accepted"] != nil && privacyAccepted) {
        rootViewController = [[MainViewController alloc] initWithUrlReceived:nil];
    } else {
	   rootViewController = [[OnboardingViewController alloc] init];
    }
    
    self.window.rootViewController = rootViewController;
}

void setAppLanguage(NSString *language) {
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"appLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [NSBundle setLanguage:language];
}

-(BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    URLString = [url absoluteString];
    [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:URL];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self updateOrCreateMainViewControllerWithMode:ViewModesSign :url];
    
    return YES;
}

- (void)updateOrCreateMainViewControllerWithMode:(ViewModes)mode :(NSURL*)url{
    MainViewController *rootViewController = [[MainViewController alloc] initWithUrlReceived:url];
    self.window.rootViewController =  rootViewController;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    state = BACKGROUND;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
