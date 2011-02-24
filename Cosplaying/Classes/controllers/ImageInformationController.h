//
//  ImageInformationController.h
//  Cosplaying
//
//  Created by Hello Baby on 9/16/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageInformationController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	
	NSMutableArray *array;
	UITableView *reviewsView;
	int offset;
	UIBarItem *titleBarItem;
	UIButton *moreReviews;
}

@property (nonatomic, retain) IBOutlet UITableView *reviewsView;
@property (nonatomic, retain) IBOutlet UIBarItem *titleBarItem;

- (IBAction)back;
- (IBAction)writeReview:(id)sender;
- (IBAction)loadMoreReviews;

@end
