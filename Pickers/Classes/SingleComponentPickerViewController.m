//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SingleComponentPickerViewController.h"


@implementation SingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

- (IBAction)buttonPressed {
	NSInteger row = [singlePicker selectedRowInComponent:0];
	NSString *selected = [pickerData objectAtIndex:row];
	NSString *title = [[NSString alloc] initWithFormat:@"You selected %@", selected];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
													message:@"Thank you for choosing" 
												   delegate:nil 
										  cancelButtonTitle:@"You are welcome" 
										  otherButtonTitles:nil];
	
	[alert show];
	[alert release];
	[title release];
	[selected release];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"View Did Load");
	NSArray *array = [[NSArray alloc] initWithObjects: @"iPhone", @"Android", @"Windows Mobile", @"Symbian", @"J2ME", nil];
	self.pickerData = array;
	[array release];
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
	self.pickerData = nil;
	self.singlePicker = nil;
}


- (void)dealloc {
	[self.pickerData release];
	[self.singlePicker release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker DataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [self.pickerData count];
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self.pickerData objectAtIndex:row];
}

@end
