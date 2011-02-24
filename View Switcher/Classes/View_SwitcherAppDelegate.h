//
//  View_SwitcherAppDelegate.h
//  View Switcher
//
//  Created by James Wang on 3/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@class SwitchViewController;

@interface View_SwitcherAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
	SwitchViewController *switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwitchViewController *switchViewController;

@end

