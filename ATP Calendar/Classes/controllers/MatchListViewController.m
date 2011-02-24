//
//  MatchListViewController.m
//  ATP Calendar
//
//  Created by Hello Baby on 4/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MatchListViewController.h"
#import "Context.h"
#import "UITableView-WithCell.h"
#import "Match.h"
#import "MatchDetailViewController.h"
#import "MatchImageCoverFlowViewController.h"

@implementation MatchListViewController
@synthesize matches;

- (void)viewDidLoad {

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}


#pragma mark -
#pragma mark UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [matches count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueOrInit:@"MatchListCell" withStyle:UITableViewCellStyleSubtitle];
	Match * match = [matches objectAtIndex:[indexPath row]];
	cell.textLabel.text = match.name;
	NSString *detail = [[NSString alloc] initWithFormat:@"%@ %@, %@", match.date, match.city, match.country];
	cell.detailTextLabel.text = detail;
	[detail release];
	cell.imageView.image = [match categoryImage];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (Match *) match: (NSIndexPath *) indexPath  {
	return [matches objectAtIndex:[indexPath row]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Match *match = [self match: indexPath];
	MatchDetailViewController *detailViewController = [[MatchDetailViewController alloc] initWithNibName:@"MatchDetailView" bundle:nil];
	detailViewController.title = @"Detail";
	detailViewController.match = match;
	UIScrollView *view = (UIScrollView *) detailViewController.view;
	view.scrollEnabled = YES;
	[view setContentSize:CGSizeMake(320, 460)];
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (void)dealloc {
    [super dealloc];
}




@end
