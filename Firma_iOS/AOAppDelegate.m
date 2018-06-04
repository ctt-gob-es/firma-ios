 //
//  AOAppDelegate.m
//  Firma_iOS
//

#import "AOAppDelegate.h"
#import "AOAboutViewController.h"
#import "AORegisteredCertificatesTVC.h"
#import "GAI.h"

@implementation AOAppDelegate

NSString *URLString, *state = @"Inactive";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[self.window makeKeyAndVisible];
    
    [self registerDefaultsFromSettingsBundle];

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

//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
//   
//    return YES;    
//}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    URLString = [url absoluteString];
    [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:@"url"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([state isEqualToString:@"Inactive"]) {
        
        UIStoryboard *mainStoryboard;
        if ([(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"] ) {
            
            mainStoryboard = [UIStoryboard storyboardWithName:@"iPadStoryboard"
                                                                     bundle: nil];
        }
        else {
            
            mainStoryboard = [UIStoryboard storyboardWithName:@"iPhoneStoryboard"
                                                       bundle: nil];
        }
        
        AORegisteredCertificatesTVC *registeredCertificatesTVC = (AORegisteredCertificatesTVC *)[mainStoryboard instantiateViewControllerWithIdentifier:@"AORegisteredCertificatesTVC"];
        
        [registeredCertificatesTVC setMode:AORegisteredCertificatesTVCModeSign];
        [registeredCertificatesTVC setStartURL:URLString];
        
        self.window.rootViewController = registeredCertificatesTVC;
    }
    else {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"urlReaded" object:URLString];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    state = @"Background";
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"Will Enter Foreground ");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"Will Terminate ");
}

/**
 Método que obtiene los datos introducidos en la pantalla de preferencias.
 */
- (void)registerDefaultsFromSettingsBundle
{
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle)
    {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences)
    {
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key)
        {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
            NSLog(@"Delegate - Valor de defaultsToRegister -> %@", defaultsToRegister);
        }
        NSLog(@"Delegate - Valor de la clave -> %@", key);
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
    [defaultsToRegister release];
}

@end
