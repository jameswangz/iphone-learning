//
//  ATP_CalendarAppDelegate.h
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright DerbySoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchImageFlowCoverViewDelegate.h"
#import "Reachability.h"

@interface ATP_CalendarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
	NSArray *store;
	MatchImageFlowCoverViewDelegate *matchImageFlowCoverViewDelegate;
	Reachability *serverReachability;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSArray *store;
@property (nonatomic, retain) MatchImageFlowCoverViewDelegate *matchImageFlowCoverViewDelegate;
@property (nonatomic, retain) Reachability *serverReachability;

@end

