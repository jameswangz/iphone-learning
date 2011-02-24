//
//  Cell1ViewController.m
//  Cell1
//
//  Created by Hello Baby on 4/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Cell11ViewController.h"

@implementation Cell11ViewController
@synthesize computers;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSDictionary *row1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"MacBook", @"Name", @"White", @"Color", nil];
	NSDictionary *row2 = [[NSDictionary alloc] initWithObjectsAndKeys: @"MacBook Pro", @"Name", @"Silver", @"Color", nil];
	NSDictionary *row3 = [[NSDictionary alloc] initWithObjectsAndKeys: @"iMac", @"Name", @"White", @"Color", nil];
	NSDictionary *row4 = [[NSDictionary alloc] initWithObjectsAndKeys: @"Mac Mini", @"Name", @"White", @"Color", nil];
	NSDictionary *row5 = [[NSDictionary alloc] initWithObjectsAndKeys: @"Mac Pro", @"Name", @"Silver", @"Color", nil];
	
	NSArray *array = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, row5, nil];
	self.computers = array;
	
	[row1 release];
	[row2 release];
	[row3 release];
	[row4 release];
	[row5 release];
	[array release];
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.computers = nil;
}


- (void)dealloc {
	[self.computers release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	NSLog(@"Count : %i", [self.computers count]);
	return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellTableIdentifier = @"CellTableIdentifier ";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellTableIdentifier];
	if (cell == nil) { 
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier] autorelease];
		
		CGRect nameLabelRect = CGRectMake(0, 5, 70, 15); 
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect]; 
		nameLabel.textAlignment = UITextAlignmentRight; 
		nameLabel.text = @"Name:"; 
		nameLabel.font = [UIFont boldSystemFontOfSize:12]; 
		[cell.contentView addSubview: nameLabel]; 
		[nameLabel release];
		
		CGRect colorLabelRect = CGRectMake(0, 26, 70, 15); 
		UILabel *colorLabel = [[UILabel alloc] initWithFrame: colorLabelRect]; 
		colorLabel.textAlignment = UITextAlignmentRight; 
		colorLabel.text = @"Color:"; 
		colorLabel.font = [UIFont boldSystemFontOfSize:12]; 
		[cell.contentView addSubview: colorLabel];
		[colorLabel release];
		
		CGRect nameValueRect = CGRectMake(80, 5, 200, 15); 
		UILabel *nameValue = [[UILabel alloc] initWithFrame: nameValueRect]; 
		nameValue.tag = kNameValueTag; [cell.contentView addSubview:nameValue]; 
		[nameValue release];
		CGRect colorValueRect = CGRectMake(80, 25, 200, 15); 
		UILabel *colorValue = [[UILabel alloc] initWithFrame: colorValueRect]; 
		colorValue.tag = kColorValueTag; [cell.contentView addSubview:colorValue]; 
		[colorValue release];
		
		NSUInteger row = [indexPath row]; 
		NSDictionary *rowData = [self.computers objectAtIndex:row]; 
		UILabel *name = (UILabel *)[cell.contentView viewWithTag:
									kNameValueTag]; name.text = [rowData objectForKey:@"Name"];
		UILabel *color = (UILabel *)[cell.contentView viewWithTag: kColorValueTag];
		color.text = [rowData objectForKey:@"Color"]; 
	}
	
	return cell;
}	

@end
