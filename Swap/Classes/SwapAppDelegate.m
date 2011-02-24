//
//  SwapAppDelegate.m
//  Swap
//
//  Created by James Wang on 3/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SwapAppDelegate.h"
#import "SwapViewController.h"

@implementation SwapAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
