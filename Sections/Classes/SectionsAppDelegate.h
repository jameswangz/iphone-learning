//
//  SectionsAppDelegate.h
//  Sections
//
//  Created by James Wang on 4/11/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionsViewController;

@interface SectionsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SectionsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SectionsViewController *viewController;

@end

