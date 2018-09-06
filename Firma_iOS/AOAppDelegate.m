 //
//  AOAppDelegate.m
//  Firma_iOS
//

#import "AOAppDelegate.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"
#import "AOAboutViewController.h"
#import "AORegisteredCertificatesTVC.h"
#import "GAI.h"
#import "GlobalConstants.h"

@implementation AOAppDelegate

NSString *URLString, *state = @"Inactive";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configure CocoaLumberjack
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    [self registerDefaultsFromSettingsBundle];
    [self setupLogger];

/*    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker.
    [[GAI sharedInstance] tr<ackerWithTrackingId:@"UA-41615516-1"];*/
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    URLString = [url absoluteString];
    [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:URL];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([state isEqualToString:INACTIVE]) {
        
        UIStoryboard *mainStoryboard;
        if ([(NSString*)[UIDevice currentDevice].model hasPrefix:IPAD] ) {
            
            mainStoryboard = [UIStoryboard storyboardWithName:IPAD_STORYBOARD
                                                                     bundle: nil];
        }
        else {
            
            mainStoryboard = [UIStoryboard storyboardWithName:IPHONE_STORYBOARD
                                                       bundle: nil];
        }
        
        AORegisteredCertificatesTVC *registeredCertificatesTVC = (AORegisteredCertificatesTVC *)[mainStoryboard instantiateViewControllerWithIdentifier:@"AORegisteredCertificatesTVC"];
        
        [registeredCertificatesTVC setMode:AORegisteredCertificatesTVCModeSign];
        [registeredCertificatesTVC setStartURL:URLString];
        
        self.window.rootViewController = registeredCertificatesTVC;
    }
    else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:URL_READED object:URLString];
                DDLogDebug(@"\n\n ** URL AppDelegate => %@", URLString);
            });
        });
    }
    
    return YES;
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
    DDLogDebug(@"Will Enter Foreground ");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    DDLogDebug(@"Will Terminate ");
}

- (void)setupLogger
{
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}

/**
 Método que obtiene los datos introducidos en la pantalla de preferencias.
 */
- (void)registerDefaultsFromSettingsBundle
{
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle)
    {
        DDLogDebug(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray *preferences = [settings objectForKey:PREFERENCE_SPECIFIERS];
    
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences)
    {
        NSString *key = [prefSpecification objectForKey:KEY];
        if(key)
        {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
            DDLogDebug(@"Delegate - Valor de defaultsToRegister -> %@", defaultsToRegister);
        }
        DDLogDebug(@"Delegate - Valor de la clave -> %@", key);
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
}

@end
