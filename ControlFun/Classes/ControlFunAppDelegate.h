//
//  ControlFunAppDelegate.h
//  ControlFun
//
//  Created by Hello Baby on 2/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControlFunViewController;

@interface ControlFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ControlFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ControlFunViewController *viewController;

@end

