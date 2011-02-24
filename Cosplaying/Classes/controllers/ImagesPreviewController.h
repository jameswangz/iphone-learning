//
//  ImagesPreviewController.h
//  Cosplaying
//
//  Created by James Wang on 8/28/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITuneReviewer.h"

#define IMAGES_PER_PAGE 4

@interface ImagesPreviewController : UIViewController <UISearchBarDelegate, UIActionSheetDelegate> {

	UISearchBar *searchBar;
	UISegmentedControl *segmentedControl;
	UIImageView *imageView1;
	UIImageView *imageView2;
	UIImageView *imageView3;
	UIImageView *imageView4;
	
	int offset;
	BOOL nomore;
	NSString *q;
	NSString *keyword;
	
	UIDatePicker *datePicker;
	UIButton *previousButton;
	UIButton *nextButton;
	
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) IBOutlet UIImageView *imageView1;
@property (nonatomic, retain) IBOutlet UIImageView *imageView2;
@property (nonatomic, retain) IBOutlet UIImageView *imageView3;
@property (nonatomic, retain) IBOutlet UIImageView *imageView4;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UIButton *previousButton;
@property (nonatomic, retain) IBOutlet UIButton *nextButton;


@property (nonatomic, retain) NSString *q;
@property (nonatomic, retain) NSString *keyword;
@property (nonatomic) int offset;

- (IBAction)searchButtonPressed;
- (IBAction)segmentPressed;
- (IBAction)previousPressed;
- (IBAction)nextPressed;
- (IBAction)showDatePicker;

@end
