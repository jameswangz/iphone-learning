//
//  DisclosureButtonController.m
//  Nav
//
//  Created by Hello Baby on 4/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DisclosureButtonController.h"
#import "DisclosureDetailController.h"

@implementation DisclosureButtonController
@synthesize list;

- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Toy Story", @"A Bug's Life", @"Toy Story 2", @"Monsters, Inc.",
					  @"Finding Nemo", @"The Incredibles", @"Cars", @"Ratatouille", @"WALL-E", @"Up", @"Toy Story 3", @"Cars 2", @"The Bear and the Bow", @"Newt", nil];
	
	self.list = array;
	[array release];
	[super viewDidLoad];
}

- (void)viewDidUnload {
	list = nil;
	detailController = nil;
	[super viewDidUnload];
}

- (void)dealloc {
	[list release];
	[detailController release];
	[super dealloc];
}

#pragma mark -
#pragma mark UITableView DataSource Methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *DisclosureButtonIdentier = @"DisclosureButtonIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonIdentier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonIdentier] autorelease];
	}
							 
	cell.textLabel.text = [self.list objectAtIndex:[indexPath row]];
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	return cell;
}

#pragma mark UITableView Delegate Methods
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey, do you see the disclosure button?" 
													message:@"If you are tring to trill down, touch that instead." 
												   delegate:nil 
										  cancelButtonTitle:@"Won't happen again." 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	if (detailController == nil) {
		detailController = [[DisclosureDetailController alloc] initWithNibName:@"DisclosureDetail" bundle:nil];
	}
	
	detailController.title = @"Detail";
	detailController.message = [NSString stringWithFormat:@"Detail information for %@", [self.list objectAtIndex:[indexPath row]]];
	
	[self.navigationController pushViewController:detailController animated:YES];
}

@end
