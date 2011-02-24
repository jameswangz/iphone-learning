//
//  SectionsViewController.h
//  Sections
//
//  Created by James Wang on 4/11/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
	UITableView *table;
	UISearchBar *search;
	NSMutableDictionary *names;
	NSMutableArray *keys;
	NSDictionary *allNames;
}

@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) IBOutlet UISearchBar *search;
@property (nonatomic, retain) NSMutableDictionary *names;
@property (nonatomic, retain) NSMutableArray *keys;
@property (nonatomic, retain) NSDictionary *allNames;

- (void)resetSearch;
- (void)handleSearchForTerm:(NSString *) searchTerm;

@end

