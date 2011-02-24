//
//  SwitchViewController.m
//  View Switcher
//
//  Created by James Wang on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@implementation SwitchViewController
@synthesize yellowViewController;
@synthesize blueViewController;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
	self.blueViewController = blueController;
	[self.view insertSubview:blueController.view atIndex:0];
	[blueController release];
	[super viewDidLoad];
}

- (IBAction)switchViews:(id)sender {
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	if (self.yellowViewController.view.superview == nil)
	{
		if (self.yellowViewController == nil)
		{
			YellowViewController *yellowController = [[YellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
			 self.yellowViewController = yellowController;
			 [yellowController release];
		}
			 
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
		
		[blueViewController viewWillDisappear:YES];
		[yellowViewController viewWillAppear:YES];
		
		[blueViewController.view removeFromSuperview];
		[self.view insertSubview:yellowViewController.view atIndex:0];	 
		
		[blueViewController viewDidAppear:YES];
		[yellowViewController viewDidDisappear:YES];
	}
	else
	{
		if (self.blueViewController == nil)
		{
			BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
			self.blueViewController = blueController;
			[blueController release];
		}
			
		[UIView setAnimationTransition:8 forView:self.view cache:YES];
		
		[blueViewController viewWillAppear:YES];
		[yellowViewController viewWillDisappear:YES];
		
		[yellowViewController.view removeFromSuperview];
		[self.view insertSubview:blueViewController.view atIndex:0];
		
		[blueViewController viewDidAppear:YES];
		[yellowViewController viewDidDisappear:YES];
	}
	
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
	if (self.blueViewController.view.superview == nil) {
		self.blueViewController = nil;
	}
	else {
		self.yellowViewController = nil;
	}

}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[yellowViewController release];
	[blueViewController release];
    [super dealloc];
}


@end
