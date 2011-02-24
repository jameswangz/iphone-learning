//
//  FirstLevelViewController.m
//  Nav
//
//  Created by James Wang on 4/13/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelViewController.h"
#import "DisclosureButtonController.h"

@implementation FirstLevelViewController
@synthesize controllers;

- (void)viewDidLoad {
	self.title = @"First Level";
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	//Disclosure Button
	DisclosureButtonController *disclosureButtonController = [[DisclosureButtonController alloc] initWithStyle:UITableViewStylePlain];
	disclosureButtonController.title = @"Disclosure Buttons";
	disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
	[array addObject:disclosureButtonController];
	[disclosureButtonController release];
	
	self.controllers = array;
	[array release];
	[super viewDidLoad];
}

- (void)viewDidUnload {
	[controllers release];
	[super viewDidUnload];
}

- (void) dealloc {
	controllers = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark UITableView Data Source Methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *FirstLevelIdentifier = @"FirstLevelCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstLevelIdentifier] autorelease];
	}
	
	SecondLevelViewController *secondLevelController = [controllers objectAtIndex:[indexPath row]];
	cell.textLabel.text = secondLevelController.title;
	cell.imageView.image = secondLevelController.rowImage;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	SecondLevelViewController *nextController = [controllers objectAtIndex:[indexPath row]];
	[self.navigationController pushViewController:nextController animated:YES];
}

@end
