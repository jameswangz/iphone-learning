//
//  ControlFunViewController.h
//  ControlFun
//
//  Created by Hello Baby on 2/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSwitchesSegmentIndex 0

@interface ControlFunViewController : UIViewController <UIActionSheetDelegate> {
	UITextField *nameField;
	UITextField *numberField;
	UILabel *sliderLabel;
	UISwitch *leftSwitch;
	UISwitch *rightSwitch;
	UIButton *doSomethingButton;
}

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *numberField;
@property (nonatomic, retain) IBOutlet UILabel *sliderLabel;
@property (nonatomic, retain) IBOutlet UISwitch *leftSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *rightSwitch;
@property (nonatomic, retain) IBOutlet UIButton *doSomethingButton;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)toggleControls:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)buttonPressed;

@end

