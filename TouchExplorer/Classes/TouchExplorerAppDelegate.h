//
//  TouchExplorerAppDelegate.h
//  TouchExplorer
//
//  Created by James Wang on 2/21/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchExplorerViewController;

@interface TouchExplorerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchExplorerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchExplorerViewController *viewController;

@end

