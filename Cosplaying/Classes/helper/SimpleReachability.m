//
//  SimpleReachability.m
//  Cosplaying
//
//  Created by James Wang on 10/4/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "SimpleReachability.h"


@implementation SimpleReachability

+ (BOOL)internetAvailable {
	NSStringEncoding encoding = NSUTF8StringEncoding;
	NSString *response = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://freezedisk.googlecode.com/svn/trunk/ping.txt"]
											  usedEncoding:&encoding
													 error:nil];
	return [response length] > 0;
}

@end
