//
//  NavAppDelegate.m
//  Nav
//
//  Created by James Wang on 4/13/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "NavAppDelegate.h"

@implementation NavAppDelegate

@synthesize window;
@synthesize navController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
	[navController release];
    [window release];
    [super dealloc];
}


@end
