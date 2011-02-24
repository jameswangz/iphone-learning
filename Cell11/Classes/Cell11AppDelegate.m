//
//  Cell11AppDelegate.m
//  Cell11
//
//  Created by Hello Baby on 4/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Cell11AppDelegate.h"
#import "Cell11ViewController.h"

@implementation Cell11AppDelegate

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
