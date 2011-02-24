//
//  Context.m
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "Context.h"
#import "ATP_CalendarAppDelegate.h"

@implementation Context

+ (ATP_CalendarAppDelegate *)delegate {
	return (ATP_CalendarAppDelegate *) [[UIApplication sharedApplication] delegate];
}

+ (NSArray *)store {
	return [self delegate].store;
}

+ (NSString *)documentsDirectory {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths objectAtIndex:0];
}

+ (NetworkStatus)networkStatus {
	return [[self delegate].serverReachability currentReachabilityStatus];
}


@end
