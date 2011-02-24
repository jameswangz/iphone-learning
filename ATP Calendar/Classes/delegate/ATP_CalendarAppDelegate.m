//
//  ATP_CalendarAppDelegate.m
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "ATP_CalendarAppDelegate.h"
#import "RootViewController.h"
#import "ResourceLoader.h"

@implementation ATP_CalendarAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize store;
@synthesize matchImageFlowCoverViewDelegate;
@synthesize serverReachability;

- (void)initStore {
	self.store = [ResourceLoader loadData];
}

- (void)initMatchImageFlowCoverViewDelegate {
	self.matchImageFlowCoverViewDelegate = [[MatchImageFlowCoverViewDelegate alloc] init];
}

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification*) note
{
	NSParameterAssert([[note object] isKindOfClass: [Reachability class]]);
	self.serverReachability = [note object];
}

- (void)initServerReachability {
	self.serverReachability = [Reachability reachabilityWithHostName:SERVER];
	[self.serverReachability startNotifer];
	
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	[self initStore];
	[self initMatchImageFlowCoverViewDelegate];
	[self initServerReachability];
	
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	[self.serverReachability stopNotifer];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[matchImageFlowCoverViewDelegate release];
	[navigationController release];
	[window release];
	[store release];
	[serverReachability release];
	[super dealloc];
}


@end

