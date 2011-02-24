//
//  SectionsViewController.m
//  Sections
//
//  Created by James Wang on 4/11/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import "SectionsViewController.h"
#import "NSDictionary-MutableDeepCopy.h"

@implementation SectionsViewController
@synthesize table;
@synthesize search;
@synthesize names;
@synthesize keys;
@synthesize allNames;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	self.allNames = dict;
	[dict release];

	[self resetSearch];
	[table reloadData];
	[table setContentOffset:CGPointMake(0.0, 44.0) animated:NO];
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.table = nil;
	self.search = nil;
	self.allNames = nil;
	self.names = nil;
	self.keys = nil;
}


- (void)dealloc {
	[self.table release];
	[self.search release];
	[self.allNames release];
	[self.names release];
	[self.keys release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableView Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.keys count] > 0 ? [self.keys count] : 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	if ([self.keys count] == 0) {
		return 0;
	}
	NSString *key = [self.keys objectAtIndex:section];
	return [[self.names objectForKey:key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *key = [self.keys objectAtIndex:[indexPath section]];
	NSInteger row = [indexPath row];
	NSString *name = [[self.names objectForKey:key] objectAtIndex:row];
	
	NSString *SectionTableIdentifier = @"SectionTableViewIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionTableIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SectionTableIdentifier];
	}
	
	cell.textLabel.text = name;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([self.keys count] == 0) {
		return nil;
	}
	
	NSString *key = [self.keys objectAtIndex:section];
	if (key == UITableViewIndexSearch) {
		return nil;
	}
	return key;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	return keys;
}

#pragma mark -
#pragma mark UITableView Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[search resignFirstResponder];
	return indexPath;
}


#pragma mark -
#pragma mark Custom Methods

- (void)resetSearch {
	NSMutableDictionary *allNamesCopy = [self.allNames mutableDeepCopy];
	self.names = allNamesCopy;
	[allNamesCopy release];

	NSMutableArray *keyArray = [[NSMutableArray alloc] init];
	[keyArray addObject:UITableViewIndexSearch];
	[keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
	self.keys = keyArray;
	[keyArray release];
}

- (void)handleSearchForTerm:(NSString *)searchTerm {
	[self resetSearch];
	NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
	
	for (NSString *key in self.keys) {
		NSMutableArray *array = [names valueForKey:key];
		NSMutableArray *toRemove = [[NSMutableArray alloc] init];
		
		for (NSString *name in array) {
			Boolean notFound = [name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound;
			if (notFound) {
				[toRemove addObject:name];
			}
		}
		
		if ([array count] == [toRemove count]) {
			[sectionsToRemove addObject:key];
		}
		
		[array removeObjectsInArray:toRemove];
		[toRemove release];
	}
	
	[self.keys removeObjectsInArray:sectionsToRemove];
	[sectionsToRemove release];
	[table reloadData];
}

#pragma mark -
#pragma mark Search Bar Delegate Methods
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self handleSearchForTerm:[searchBar text]];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	searchBar.text = @"";
	[self resetSearch];
	[table reloadData];
	[searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchTerm {
	if ([searchTerm length] == 0) {
		[self resetSearch];
		[table reloadData];
		return;
	}
	[self handleSearchForTerm:searchTerm];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
	NSString *key = [self.keys objectAtIndex:index];
	if (key == UITableViewIndexSearch) {
		[tableView setContentOffset:CGPointZero animated:NO];
		return NSNotFound;
	}
	return index;
}

@end
