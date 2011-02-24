//
//  Simple_TableViewController.m
//  Simple Table
//
//  Created by Hello Baby on 4/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Simple_TableViewController.h"

@implementation Simple_TableViewController
@synthesize listData;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy", @"Sneezy", @"Bashful", @"Happy", 
					  @"Doc", @"Grumpy", @"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", 
					  @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur", nil];
	self.listData = array;
	[array release];
    [super viewDidLoad];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.listData = nil;
}


- (void)dealloc {
	[self.listData release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableView DataSource Methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString * SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									   reuseIdentifier:SimpleTableIdentifier] autorelease];
	}
	
	cell.imageView.image = [UIImage imageNamed:@"star.png"];
	cell.imageView.highlightedImage = [UIImage imageNamed:@"star2.png"];
	int row = [indexPath row];
	cell.textLabel.text = [self.listData objectAtIndex:row];
	cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
	//cell.textLabel.textColor = [UIColor blueColor];
	
	if (row < 7) {
		cell.detailTextLabel.text = @"Mr. Desiney";
	} else {
		cell.detailTextLabel.text = @"Mr. Tolkein";
	}
	
	return cell;
}

#pragma mark UITableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	int row = [indexPath row];
	return row % 4 == 0 ? 0 : 2;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([indexPath row] == 0) {
		return nil;
	}
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *rowValue = [self.listData objectAtIndex:[indexPath row]];
	NSString *message = [[NSString alloc] initWithFormat:@"You selected row %@", rowValue];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hi, dude" 
													message:message 
												   delegate:nil 
										  cancelButtonTitle:@"Yes, I did." 
										  otherButtonTitles:nil];
	[alert show];
	[message release];
	[alert release];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70;
}

@end
