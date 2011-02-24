//
//  DependentComponentPickerViewController.m
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

@implementation DependentComponentPickerViewController
@synthesize picker, stateZips, states, zips;

- (IBAction)buttonPressed {
	NSString *state = [self.states objectAtIndex:[self.picker selectedRowInComponent:kStateComponent]];
	NSString *zip = [self.zips objectAtIndex:[self.picker selectedRowInComponent:kZipComponent]];
	NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
	
	UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"States And Zips"
													 message:message 
													delegate:nil 
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
	
	[alert show];
	[alert release];
	[message release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *plistPath = [bundle pathForResource:@"statedictionary" ofType:@"plist"];
	NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	self.stateZips = dictionary;
	[dictionary release];
	
	NSArray *components = [self.stateZips allKeys];
	NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
	self.states = sorted;
	
	NSString *selectedState = [self.states objectAtIndex:0];
	NSArray *array = [self.stateZips objectForKey:selectedState];
	self.zips = array;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.picker = nil;
	self.stateZips = nil;
	self.states = nil;
	self.zips = nil;
}


- (void)dealloc {
	[self.picker release];
	[self.stateZips release];
	[self.states release];
	[self.zips release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker DataSource Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) view {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)view 
numberOfRowsInComponent:(NSInteger) component {
	if (component == kStateComponent) {
		return [self.states count];
	}
	return [self.zips count];
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger) row forComponent:(NSInteger) component {
	if (component == kStateComponent) {
		return [self.states objectAtIndex:row];
	}
	return [self.zips objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (component == kStateComponent) {
		NSString *state = [self.states objectAtIndex:row];
		NSArray *valueArray = [self.stateZips objectForKey:state];
		self.zips = valueArray;
		[picker selectRow:0 inComponent:kZipComponent animated:YES];
		[picker reloadComponent:kZipComponent];
	}
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	if (component == kZipComponent) {
		return 90;
	}
	return 200;
}


@end
