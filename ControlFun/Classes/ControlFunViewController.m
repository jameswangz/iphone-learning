//
//  ControlFunViewController.m
//  ControlFun
//
//  Created by Hello Baby on 2/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ControlFunViewController.h"

@implementation ControlFunViewController

@synthesize nameField;
@synthesize numberField;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize doSomethingButton;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
	UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
	[doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
	
	UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
	UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12	topCapHeight:0];
	[doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
	
    //[super viewDidLoad];
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	// return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
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

- (IBAction)textFieldDoneEditing:(id)sender {
	[sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
	[nameField resignFirstResponder];
	[numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(id)sender {
	UISlider *slider = (UISlider *) sender;
	int progressAsInt = (int) (slider.value + 0.5f);
	NSString *newText = [[NSString alloc]initWithFormat:@"%d", progressAsInt];
	sliderLabel.text = newText;
	[newText release];
}

- (IBAction)toggleControls:(id)sender {
	if ([sender selectedSegmentIndex] == kSwitchesSegmentIndex) {
		leftSwitch.hidden = NO;
		rightSwitch.hidden = NO;
		doSomethingButton.hidden = YES;
	} else {
		leftSwitch.hidden = YES;
		rightSwitch.hidden = YES;
		doSomethingButton.hidden = NO;
	}
}

- (IBAction)switchChanged:(id)sender {
	UISwitch *whichSwitch = (UISwitch *) sender;
	BOOL setting = whichSwitch.isOn;
	[leftSwitch setOn:setting animated:YES];
	[rightSwitch setOn:setting animated:YES];
}

- (IBAction)buttonPressed {
	UIActionSheet *actionSheet = [[UIActionSheet alloc] 
								  initWithTitle:@"Are you sure?" 
								  delegate:self
								  cancelButtonTitle:@"No Way!"
								  destructiveButtonTitle:@"Yes, I'm Sure!" 
								  otherButtonTitles:nil];
	
	[actionSheet showInView:self.view];
	[actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (buttonIndex != [actionSheet cancelButtonIndex]) 
	{
		NSString *msg = nil;
		
		if (nameField.text.length > 0) 
		{
			msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, everything went OK.",
				   nameField.text];
		}
		else
		{
			msg = @"You can breathe easy, everything went OK.";
		}
		
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Something was done" 
							  message:msg
							  delegate:nil
							  cancelButtonTitle:@"Phew" 
							  otherButtonTitles:nil];
		
		[alert show];
		[alert release];
		[msg release];
	}
}


- (void)dealloc {
	[nameField release];
	[numberField release];
	[sliderLabel release];
	[leftSwitch release];
	[rightSwitch release];
	[doSomethingButton release];
    [super dealloc];
}

@end
