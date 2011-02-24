//
//  Simple_TableAppDelegate.m
//  Simple Table
//
//  Created by Hello Baby on 4/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Simple_TableAppDelegate.h"
#import "Simple_TableViewController.h"

@implementation Simple_TableAppDelegate

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
