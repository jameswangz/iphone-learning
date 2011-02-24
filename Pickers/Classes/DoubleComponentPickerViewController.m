//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"


@implementation DoubleComponentPickerViewController
@synthesize doublePicker, fillingTypes, breadTypes;

- (IBAction)buttonPressed {
	NSString *filling = [fillingTypes objectAtIndex:[doublePicker selectedRowInComponent:kFillingComponent]];
	NSString *bread = [breadTypes objectAtIndex:[doublePicker selectedRowInComponent:kBreadComponent]];
	NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up. ", filling, bread];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your order" 
													message:message 
												   delegate:nil 
										  cancelButtonTitle:@"Great!" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	[message release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSArray *breadArray = [[NSArray alloc] initWithObjects:@"White", 
						   @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain",nil];
	self.breadTypes = breadArray;
	[breadArray release];
	
	NSArray *fillingArray = [[NSArray alloc] initWithObjects:@"Ham", 
							 @"Turkey", @"Peanut Butter", @"Tuna Salad", 
							 @"Chicken Salad", @"Roast Beef", @"Vegemite", nil];
	self.fillingTypes = fillingArray;
	[fillingArray release];
	
	[super viewDidLoad];
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
	self.doublePicker = nil;
	self.fillingTypes = nil;
	self.breadTypes = nil;
}


- (void)dealloc {
	[self.doublePicker release];
	[self.fillingTypes release];
	[self.breadTypes release];
	[super dealloc];
}

#pragma mark -
#pragma mark Picker DataSource Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *) pickerView
numberOfRowsInComponent:(NSInteger) component {
	if (component == kFillingComponent) 
		return [self.fillingTypes count];
	
	return [self.breadTypes count];
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row
			forComponent:(NSInteger)component {
	
	if (component == kFillingComponent) 
		return [self.fillingTypes objectAtIndex:row];
	
	return [self.breadTypes objectAtIndex:row];
}


@end
