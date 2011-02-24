//
//  GDataXMLNode-Extension.h
//  ATP Calendar
//
//  Created by James Wang on 4/25/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "GDataXMLNode.h"

@interface GDataXMLElement (Extension) 
- (GDataXMLElement *)singleElementForName:(NSString *)name;
- (NSString *)stringValueForName:(NSString *)name;
@end
