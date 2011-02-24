//
//  Context.m
//  Cosplaying
//
//  Created by James Wang on 9/22/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "Context.h"


@implementation Context
@synthesize activeImageKey;
@synthesize keyword;


+ (id)contextWithActiveImageKey:(NSString *)theKey {
	Context *context = [[Context alloc] init];
	context.activeImageKey = theKey;
	return [context autorelease];
}

- (void)dealloc {
	[activeImageKey release];
	[keyword release];
	[super dealloc];
}


@end
