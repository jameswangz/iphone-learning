//
//  Month2Matches.h
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Match;

@interface Month2Matches : NSObject {
	NSString *month;
	NSMutableArray *matches;
}

@property (nonatomic, retain) NSString *month;
@property (nonatomic, retain) NSArray *matches;

- (id)initWithName:(NSString *)theName;
- (Month2Matches *)addMatch:(Match *)match;

@end
