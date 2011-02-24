//
//  Context.h
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
@class ATP_CalendarAppDelegate;


@interface Context : NSObject {	
}

+ (ATP_CalendarAppDelegate *)delegate;
+ (NSArray *)store;
+ (NSString *)documentsDirectory;
+ (NetworkStatus)networkStatus;

@end
