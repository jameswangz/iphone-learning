//
//  AppSettingsAppDelegate.m
//  AppSettings
//
//  Created by James Wang on 5/19/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "AppSettingsAppDelegate.h"
#import "MainViewController.h"

@implementation AppSettingsAppDelegate


@synthesize window;
@synthesize mainViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
