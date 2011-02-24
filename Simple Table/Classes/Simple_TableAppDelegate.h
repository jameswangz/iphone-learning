//
//  Simple_TableAppDelegate.h
//  Simple Table
//
//  Created by Hello Baby on 4/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Simple_TableViewController;

@interface Simple_TableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Simple_TableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Simple_TableViewController *viewController;

@end

