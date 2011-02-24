//
//  FlipsideViewController.m
//  AppSettings
//
//  Created by James Wang on 5/19/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"


@implementation FlipsideViewController

@synthesize delegate;
@synthesize engineSwitch;
@synthesize warpFactorSlider;


- (void)viewDidLoad {
    [super viewDidLoad];
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	self.engineSwitch.on = [[userDefaults stringForKey:kWarpDriveKey] isEqualToString:@"Engaged"];
	self.warpFactorSlider.value = [userDefaults floatForKey:kWarpFactorKey];
}

- (void)viewWillDisappear:(BOOL)animated {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSString *engineState = self.engineSwitch.on ? @"Engaged" : @"Disabled";
	[userDefaults setValue:engineState forKey:kWarpDriveKey];
	[userDefaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
	[super viewWillAppear:animated];
}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


@end
