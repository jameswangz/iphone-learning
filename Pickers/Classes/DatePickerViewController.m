//
//  DatePickerViewController.m
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DatePickerViewController.h"


@implementation DatePickerViewController
@synthesize datePicker;

-(IBAction)buttonPressed {
	NSDate *selected = [datePicker date];
	NSString *message = [[NSString alloc] initWithFormat:
						 @"The date and time you selected is : %@", selected];
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"Date and Time Selected" 
						  message:message
						  delegate:nil
						  cancelButtonTitle:@"Yes, I did." 
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
	[message release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    NSDate *now = [[NSDate alloc] init];
	[datePicker setDate:now animated:YES];
	//	[super viewDidLoad];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.datePicker = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[datePicker release];
    [super dealloc];
}


@end
