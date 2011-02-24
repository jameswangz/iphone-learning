//
//  ITuneReviewer.m
//  Cosplaying
//
//  Created by James Wang on 10/6/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "ITuneReviewer.h"

@implementation ITuneReviewer
@synthesize delegate = _delegate;


- (void)showReviewMessageIfRequired {
	if ([_delegate onlyAppearOnce]) {
		BOOL reviwed = [[NSUserDefaults standardUserDefaults] boolForKey:USER_DEFAULTS_REVIEWED_IN_ITUNE];
		if (reviwed) {
			return;
		}
	}
	if ([_delegate shouldPresentReviewMessage]) {
		NSString *message = @"Looks you like this app, would you like write a review for it?";
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
														message:message 
													   delegate:self 
											  cancelButtonTitle:@"Later" 
											  otherButtonTitles:@"Sure!", nil];
		[alert show];
		[alert release];
		[message release];	
	}
}

#pragma mark -
#pragma mark UIAlertView delegate methods

- (void)reviewInITune {
	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:USER_DEFAULTS_REVIEWED_IN_ITUNE];
	NSString *url = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=%@&id=%@",
					 @"Purple+Software",
					 [_delegate appId]];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {
		[self reviewInITune];
	}
}

@end
