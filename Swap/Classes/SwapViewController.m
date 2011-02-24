//
//  SwapViewController.m
//  Swap
//
//  Created by James Wang on 3/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SwapViewController.h"

@implementation SwapViewController
@synthesize landscape;
@synthesize portrait;
@synthesize landscapeFooButton;
@synthesize landscapeBarButton;
@synthesize portraitFooButton;
@synthesize portraitBarButton;

	
- (void)willAnimateRotationToInterfaceOrientation:
	(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {

	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		self.view = self.portrait;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
		self.view.bounds = CGRectMake(0.0, 0.0, 300.0, 480.0);
	}
	else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		self.view = self.portrait;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
		self.view.bounds = CGRectMake(0.0, 0.0, 300.0, 480.0);
	}
	else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		self.view = self.landscape;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
		self.view.bounds = CGRectMake(0.0, 0.0, 460, 320);
	}
	else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.view = self.landscape;
		self.view.transform = CGAffineTransformIdentity;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(90));
		self.view.bounds = CGRectMake(0.0, 0.0, 460, 320);
	}
}

- (IBAction)buttonPressed:(id)sender {
	if (sender == portraitFooButton || sender == landscapeFooButton) {
		portraitFooButton.hidden = YES;
		landscapeFooButton.hidden = YES;
	} else {
		portraitBarButton.hidden = YES;
		landscapeBarButton.hidden = YES;
	}
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	self.landscape = nil;
	self.portrait = nil;
	self.landscapeFooButton = nil;
	self.landscapeBarButton = nil;
	self.portraitFooButton = nil;
	self.portraitBarButton = nil;
}


- (void)dealloc {
	[self.landscape release];
	[self.portrait release];
	[self.landscapeFooButton release];
	[self.landscapeBarButton release];
	[self.portraitFooButton release];
	[self.portraitBarButton release];
    [super dealloc];
}

@end
