//
//  ResourceProvider.m
//  ATP Calendar
//
//  Created by Hello Baby on 4/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResourceLoader.h"
#import "Month2Matches.h"
#import "Match.h"
#import "NSObject-Dialog.h"
#import "Context.h"

@implementation ResourceLoader


+ (NSArray *)loadData {
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	NSURL *dataUrl = [NSURL URLWithString:[SERVICE_URL stringByAppendingString:DATA_XML]];
	NSURL *websitesPlistUrl = [NSURL URLWithString:[SERVICE_URL stringByAppendingString:WEB_SITES_PLISt]];
	
	NSData *data2use = nil;
	NSDictionary *websites2use = nil;
	NSData *dataFromRemote = [[NSData alloc] initWithContentsOfURL:dataUrl];
	NSDictionary *websitesFromRemote = [[NSDictionary alloc] initWithContentsOfURL:websitesPlistUrl];
	NSString *localDataPath = [[Context documentsDirectory] stringByAppendingPathComponent:DATA_XML];
	NSString *localWebsitesPath = [[Context documentsDirectory] stringByAppendingPathComponent:WEB_SITES_PLISt];
	
	if ([dataFromRemote length] == 0) {
		if ([[NSFileManager defaultManager] fileExistsAtPath:localDataPath]) {
			data2use = [[NSData alloc] initWithContentsOfFile:localDataPath];
			[@"No internet connection detected, the cached data will be used, but the gallery won't be available." showInDialogWithTitle:@"Warning"];
		} else {
			//the first time of app lanuch
			[@"Unable to load data. Please try again or check your network settings. Edge/3G or WiFi must be enabled." showInDialog];
		}
	} else {
		data2use = [dataFromRemote copy];
		[dataFromRemote writeToFile:localDataPath atomically:YES];
	}
	
	if ([[websitesFromRemote allKeys] count] == 0) {
		if ([[NSFileManager defaultManager] fileExistsAtPath:localWebsitesPath]) {
			websites2use = [[NSDictionary alloc] initWithContentsOfFile:localWebsitesPath];
		} else {
			websites2use = [[NSDictionary alloc] init];
		}
	} else {
		websites2use = [websitesFromRemote copy];
		[websitesFromRemote writeToFile:localWebsitesPath atomically:YES];
	}
	
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data2use options:0 error:nil];
	GDataXMLElement * root = [doc rootElement];
	NSArray *monthes = [root elementsForName:@"month"];
	
	for (id month in monthes) {
		GDataXMLElement *monthElement = (GDataXMLElement *) month;
		NSString *monthName = [monthElement stringValueForName:@"name"];
		Month2Matches *month2Matches = [[Month2Matches alloc] initWithName:monthName];
		[array addObject:month2Matches];
		for (id eachMatchElement in [monthElement elementsForName:@"match"]) {
			GDataXMLElement *matchElement = (GDataXMLElement *) eachMatchElement;
			Match *match = [[Match alloc] initWithName:[matchElement stringValueForName:@"name"]];
			match.category = [matchElement stringValueForName:@"category"];
			match.city = [matchElement stringValueForName:@"city"];
			match.country = [matchElement stringValueForName:@"country"];
			match.date = [matchElement stringValueForName:@"date"];
			match.doubleDraw = [[matchElement stringValueForName:@"dbl"] intValue];
			NSString *doubleWinners = [matchElement stringValueForName:@"double_winners"];
			match.doubleWinners = [doubleWinners componentsSeparatedByString:@","];
			match.prizeMoney = [matchElement stringValueForName:@"prize"];
			match.singleDraw = [[matchElement stringValueForName:@"sgl"] intValue];
			match.singleWinner = [matchElement stringValueForName:@"single_winner"];
			match.surface = [matchElement stringValueForName:@"surface"];
			match.ticketEmail = [matchElement stringValueForName:@"email"];
			match.ticketPhone = [matchElement stringValueForName:@"tel"];
			match.totalFinancialCommitment = [matchElement stringValueForName:@"total"];
			match.website = [websites2use valueForKey:match.name];
			[month2Matches addMatch:match];
		}
	}
	
	[dataFromRemote release];
	[data2use release];
	[websitesFromRemote release];
	[websites2use release];
	[doc release];
	return array;
}



@end
