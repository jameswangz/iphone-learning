//
//  SwipesAppDelegate.h
//  Swipes
//
//  Created by James Wang on 2/22/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwipesViewController;

@interface SwipesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SwipesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwipesViewController *viewController;

@end

