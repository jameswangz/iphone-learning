//
//  SectionsAppDelegate.m
//  Sections
//
//  Created by James Wang on 4/11/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "SectionsAppDelegate.h"
#import "SectionsViewController.h"

@implementation SectionsAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
