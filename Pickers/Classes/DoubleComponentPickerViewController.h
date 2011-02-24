//
//  DoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController : UIViewController {
	
	UIPickerView *doublePicker;
	NSArray *fillingTypes;
	NSArray *breadTypes;
	
}

@property (nonatomic, retain) IBOutlet UIPickerView *doublePicker;
@property (nonatomic, retain) IBOutlet NSArray *fillingTypes;
@property (nonatomic, retain) IBOutlet NSArray *breadTypes;

- (IBAction)buttonPressed;

@end
