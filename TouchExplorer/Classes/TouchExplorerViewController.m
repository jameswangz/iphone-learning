//
//  TouchExplorerViewController.m
//  TouchExplorer
//
//  Created by James Wang on 2/21/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import "TouchExplorerViewController.h"

@implementation TouchExplorerViewController

@synthesize messageLabel;
@synthesize tapsLabel;
@synthesize touchesLabel;

#pragma mark -
#pragma mark Touch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	messageLabel.text = @"Touches Began";
	[self updateLabelsFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	messageLabel.text = @"Drag Detected";
	[self updateLabelsFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	messageLabel.text = @"Touches Stopped";
	[self updateLabelsFromTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	messageLabel.text = @"Touches Cancelled";
	[self updateLabelsFromTouches:touches];
}

#pragma mark -
#pragma mark Interface Methods

- (void)updateLabelsFromTouches:(NSSet *)touches {
	NSString *tapsMessage = [[NSString alloc] initWithFormat:@"%d taps detected", [[touches anyObject] tapCount]];
	tapsLabel.text = tapsMessage;
	[tapsMessage release];
	
	NSString *touchesMessage = [[NSString alloc] initWithFormat:@"%d touches detected", [touches count]];
	touchesLabel.text = touchesMessage;
	[touchesMessage release];
}


#pragma mark -
#pragma mark Memory Management Methods

- (void)viewDidUnload {
	self.messageLabel = nil;
	self.tapsLabel = nil;
	self.touchesLabel = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[messageLabel release];
	[tapsLabel release];
	[touchesLabel release];
    [super dealloc];
}

@end
