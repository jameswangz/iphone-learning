//
//  View_SwitcherAppDelegate.m
//  View Switcher
//
//  Created by James Wang on 3/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "View_SwitcherAppDelegate.h"
#import "SwitchViewController.h"

@implementation View_SwitcherAppDelegate

@synthesize window;
@synthesize switchViewController;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	[window addSubview:switchViewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {    
	[switchViewController release];
	[window release];
	[super dealloc];
}


@end

