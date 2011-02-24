//
//  Cell1AppDelegate.h
//  Cell1
//
//  Created by Hello Baby on 4/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cell1ViewController;

@interface Cell1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Cell1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Cell1ViewController *viewController;

@end

