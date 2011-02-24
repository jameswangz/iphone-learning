//
//  DependentComponentPickerViewController.h
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStateComponent	0
#define kZipComponent	1

@interface DependentComponentPickerViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource> {
	UIPickerView *picker;
	NSDictionary *stateZips;
	NSArray *states;
	NSArray *zips;
}

@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) IBOutlet NSDictionary *stateZips;
@property (nonatomic, retain) IBOutlet NSArray *states;
@property (nonatomic, retain) IBOutlet NSArray *zips;

- (IBAction)buttonPressed;

@end
