//
//  Month2Matches.m
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "Month2Matches.h"
#import "Match.h"

@implementation Month2Matches
@synthesize month;
@synthesize matches;

- (id)initWithName:(NSString *)theMonth {
	if (self = [super init]) {
		self.month = theMonth;
		self.matches = [[NSMutableArray alloc] init];
	}
	return self;
}

- (Month2Matches *)addMatch:(Match *)match {
	[matches addObject:match];
	return self;
}

- (void)dealloc {
	[self.month release];
	[self.matches release];
	[super dealloc];
}

@end
