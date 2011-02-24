//
//  SingleComponentPickerViewController.h
//  Pickers
//
//  Created by Hello Baby on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleComponentPickerViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource> {

	UIPickerView *singlePicker;
	NSArray *pickerData;
}

@property (nonatomic, retain) IBOutlet UIPickerView *singlePicker;
@property (nonatomic, retain) IBOutlet NSArray *pickerData;
- (IBAction) buttonPressed;

@end
