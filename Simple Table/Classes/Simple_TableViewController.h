//
//  Simple_TableViewController.h
//  Simple Table
//
//  Created by Hello Baby on 4/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Simple_TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *listData;
}

@property (nonatomic, retain) IBOutlet NSArray *listData;

@end

