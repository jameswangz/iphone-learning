//
//  GDataXMLNode-Extension.m
//  ATP Calendar
//
//  Created by James Wang on 4/25/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "GDataXMLNode-Extension.h"


@implementation GDataXMLElement (Extension)

- (GDataXMLElement *)singleElementForName:(NSString *)name {
	NSArray *elements = [self elementsForName:name];
	if ([elements count] == 0) {
		return nil;
	}
	return [elements objectAtIndex:0];
}

- (NSString *)stringValueForName:(NSString *)name {
	GDataXMLElement *element = [self singleElementForName:name];
	return element == nil ? nil : [element stringValue];
}

@end
