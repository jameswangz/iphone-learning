//
//  QuartzFunAppDelegate.h
//  QuartzFun
//
//  Created by James Wang on 11/3/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuartzFunViewController;

@interface QuartzFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    QuartzFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet QuartzFunViewController *viewController;

@end

