//
//  DisclosureDetailController.m
//  Nav
//
//  Created by Hello Baby on 4/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DisclosureDetailController.h"


@implementation DisclosureDetailController
@synthesize label;
@synthesize message;

- (void)viewWillAppear:(BOOL)animated {
	label.text = message;
	[super viewWillAppear:animated];
}

- (void)viewDidUnload {
	label = nil;
	message = nil;
	[super viewDidUnload];
}

- (void)dealloc {
	[label release];
	[message release];
	[super dealloc];
}

@end
