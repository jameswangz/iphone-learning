//
//  SwitchViewController.h
//  View Switcher
//
//  Created by James Wang on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlueViewController;
@class YellowViewController;


@interface SwitchViewController : UIViewController {
	
	BlueViewController *blueViewController;
	YellowViewController *yellowViewController;
}

@property (nonatomic, retain) BlueViewController *blueViewController;
@property (nonatomic, retain) YellowViewController *yellowViewController;

- (IBAction)switchViews:(id)sender;

@end
