//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerViewController.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation CustomPickerViewController
@synthesize picker;
@synthesize winLabel;
@synthesize column1;
@synthesize column2;
@synthesize column3;
@synthesize column4;
@synthesize column5;
@synthesize button;

- (IBAction)spin {
	BOOL win = NO;
	int numInRow = 1;
	int lastVal = -1;
	
	for (int i = 0; i < 5; i++) {
		int newValue = random() % [self.column1 count];
		if (newValue == lastVal) {
			numInRow++;
		} else {
			numInRow = 1;
		}
		
		lastVal = newValue;
		
		[picker selectRow:newValue inComponent:i animated:YES];
		[picker reloadComponent:i];
		
		if (numInRow >= 3) {
			win = YES;
		}
	}
	
	[self performSelector:@selector(hiddeButton)];
	[self performSelector:@selector(playCrunchSound)];
	
	if (win) {
		[self performSelector:@selector(win) withObject:nil afterDelay:.5];
	} else {
		[self performSelector:@selector(showButton) withObject:nil afterDelay:.5];
	}	
	
	winLabel.text = @"";
}

- (void)hiddeButton {
	self.button.hidden = YES;
}

- (void)showButton {
	self.button.hidden = NO;
}

-(void)playSound:(NSString *)name {
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"wav"];
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef) [NSURL fileURLWithPath:path], &soundID);
	AudioServicesPlaySystemSound(soundID);
}

-(void)playWinSound {
	[self playSound:@"win"];
}

-(void)playCrunchSound {
	[self playSound:@"crunch"];
}

- (void)win {
	[self playWinSound];
	winLabel.text = @"WIN!";
	[self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UIImage *seven = [UIImage imageNamed:@"seven.png"];
	UIImage *bar = [UIImage imageNamed:@"bar.png"];
	UIImage *crown = [UIImage imageNamed:@"crown.png"];
	UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
	UIImage *lemon = [UIImage imageNamed:@"lemon.png"];
	UIImage *apple = [UIImage imageNamed:@"apple.png"];
	
	for (int i = 1; i <= 5; i++) {
		UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
		UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
		UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
		UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
		UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
		UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
		
		NSArray *imageViewArray = [[NSArray alloc] initWithObjects:sevenView, barView, crownView, cherryView, lemonView, appleView, nil];
		NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d", i];
		[self setValue:imageViewArray forKey:fieldName];
		[fieldName release];
		[imageViewArray release];
		
		[sevenView release];
		[barView release];
		[crownView release];
		[cherryView release];
		[lemonView release];
		[appleView release];
	}

	srandom(time(NULL));
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.picker = nil;
	self.winLabel = nil;
	self.column1 = nil;
	self.column2 = nil;
	self.column3 = nil;
	self.column4 = nil;
	self.column5 = nil;
	self.button = nil;
}


- (void)dealloc {
	[self.picker release];
	[self.winLabel release];
	[self.column1 release];
	[self.column2 release];
	[self.column3 release];
	[self.column4 release];
	[self.column5 release];
	[self.button release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker DataSource Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [self.column1 count];
}

#pragma mark Picker Delegate Methods

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d", component + 1];
	NSArray *array = [self valueForKey:arrayName];
	[arrayName release];
	return [array objectAtIndex:row];
}

@end
