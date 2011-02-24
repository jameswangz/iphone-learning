//
//  Cell11AppDelegate.h
//  Cell11
//
//  Created by Hello Baby on 4/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cell11ViewController;

@interface Cell11AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Cell11ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Cell11ViewController *viewController;

@end

