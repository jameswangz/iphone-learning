//
//  MatchListViewController.h
//  ATP Calendar
//
//  Created by Hello Baby on 4/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MatchListViewController : UITableViewController {
	NSArray *matches;
}
@property (nonatomic, retain) NSArray *matches;
@end
