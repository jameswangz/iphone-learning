//
//  ResourceProvider.h
//  ATP Calendar
//
//  Created by Hello Baby on 4/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode-Extension.h"

#define SERVER @"freezedisk.googlecode.com"
#define PATH @"/svn/trunk/iphone/ATP-Calendar/"
#define SERVICE_URL	[NSString stringWithFormat:@"http://%@%@", SERVER, PATH]
#define DATA_XML @"data.xml"
#define WEB_SITES_PLISt @"websites.plist"

@interface ResourceLoader : NSObject {

}

+ (NSArray *)loadData;

@end
