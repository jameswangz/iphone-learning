//
//  CosplayingAppDelegate.h
//  Cosplaying
//
//  Created by James Wang on 8/28/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Context.h"
#import "ITuneReviewer.h"

@interface CosplayingAppDelegate : NSObject <UIApplicationDelegate, ITuneReviewerDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
	Context *context;
	ITuneReviewer *ituneReviewer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, assign) Context *context;
@property (nonatomic, assign) ITuneReviewer *ituneReviewer;


@end

