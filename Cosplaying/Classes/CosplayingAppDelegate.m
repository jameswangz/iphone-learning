//
//  CosplayingAppDelegate.m
//  Cosplaying
//
//  Created by James Wang on 8/28/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "CosplayingAppDelegate.h"
#import "ImagesPreviewController.h"
#import "Configuration.h"
#import "ITuneReviewer.h"

@implementation CosplayingAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize context;
@synthesize ituneReviewer;

#pragma mark -
#pragma mark Application lifecycle

- (void)increaseLunchTimes {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSInteger lunchTimes = [userDefaults integerForKey:USER_DEFAULTS_LUNCH_TIMES];
	[userDefaults setInteger:++lunchTimes forKey:USER_DEFAULTS_LUNCH_TIMES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after application launch.
	[window addSubview:navigationController.view];
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
    [window makeKeyAndVisible];
	context = [[Context alloc] init];
	[self increaseLunchTimes];
	ituneReviewer = [[ITuneReviewer alloc] init];
	ituneReviewer.delegate = self;
	return YES;
}

- (void)dealloc {
	[context release];
	[ituneReviewer release];
	[navigationController release];
    [window release];
    [super dealloc];
}

#pragma mark -
#pragma mark ITuneReviewerDelegate Methods

- (NSString *)appId {
	return @"396790003";
}

- (BOOL)shouldPresentReviewMessage {
	NSInteger lunchTimes = [[NSUserDefaults standardUserDefaults] integerForKey:USER_DEFAULTS_LUNCH_TIMES];
	return lunchTimes % 10 == 0;
}

- (BOOL)onlyAppearOnce {
	return YES;
}


@end
