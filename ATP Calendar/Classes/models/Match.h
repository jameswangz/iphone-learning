//
//  Match.h
//  ATP Calendar
//
//  Created by James Wang on 4/16/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Match : NSObject {
	NSString *category;
	NSString *name;
	NSString *date;
	NSString *city;
	NSString *country;
	NSString *surface;
	NSString *prizeMoney;
	NSString *totalFinancialCommitment;
	NSInteger singleDraw;
	NSInteger doubleDraw;
	NSString *ticketPhone;
	NSString *ticketEmail;
	NSString *singleWinner;
	NSArray *doubleWinners;
	NSString *website;
	NSString *introduction;
}

@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *surface;
@property (nonatomic, retain) NSString *prizeMoney;
@property (nonatomic, retain) NSString *totalFinancialCommitment;
@property (nonatomic) NSInteger singleDraw;
@property (nonatomic) NSInteger doubleDraw;
@property (nonatomic, retain) NSString *ticketPhone;
@property (nonatomic, retain) NSString *ticketEmail;
@property (nonatomic, retain) NSString *singleWinner;
@property (nonatomic, retain) NSArray *doubleWinners;
@property (nonatomic, retain) NSString *website;
@property (nonatomic, retain) NSString *introduction;

- (id)initWithName:(NSString *)theName;
- (UIImage *)categoryImage;

@end
