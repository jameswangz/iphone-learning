//
//  MatchImageFlowCoverViewDelegate.m
//  ATP Calendar
//
//  Created by James Wang on 4/27/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "MatchImageFlowCoverViewDelegate.h"
#import "ResourceLoader.h"


@implementation MatchImageFlowCoverViewDelegate
@synthesize images;

- (void)initImages {
	NSString *plistPath = [[NSString stringWithFormat:@"%@Images/Matches/%@/%@.plist", SERVICE_URL, matchName, matchName] 
						   stringByAddingPercentEscapesUsingEncoding:NSStringEncodingConversionExternalRepresentation];
	
	if (plistPath == nil) {
		return;
	}
	
	NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfURL:[NSURL URLWithString:plistPath]];
	NSInteger imageCount = [[plist valueForKey:@"ImageCount"] intValue];
	NSString *imageType = [plist valueForKey:@"ImageType"];
	
	[self.images release];
	self.images = nil;
	self.images = [[NSMutableDictionary alloc] initWithCapacity:imageCount];
	
	for (int i = 0; i < imageCount; i++) {				
		NSString *imagePath = [[NSString stringWithFormat:@"%@Images/Matches/%@/%@-%d.%@", SERVICE_URL, matchName, matchName, i, imageType] 
							   stringByAddingPercentEscapesUsingEncoding:NSStringEncodingConversionExternalRepresentation];
		
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagePath]];
		UIImage *image = [[UIImage alloc] initWithData:data];
		
		if (image) {
			[self.images setObject:image forKey:[NSString stringWithFormat:@"%d", i]];
		} else {
			NSLog(@"Couldn't load image %@", imagePath);
		}
		
		[image release];
	}
}


- (void)setMatchName:(NSString *)theMatchName {
	matchName = theMatchName;
	[self initImages];
}

- (NSString *)matchName {
	return matchName;
}

#pragma mark -
#pragma mark FlowCoverView Delegate Methods

- (int)flowCoverNumberImages:(FlowCoverView *)view
{
	return [[self.images allKeys] count];
}

- (UIImage *)flowCover:(FlowCoverView *)view cover:(int)index
{
	UIImage *image = [self.images valueForKey:[NSString stringWithFormat:@"%d", index]];
	if (!image) {
		NSLog(@"Couldn't load image for %@-%d", matchName, index);
	}
	return image;
}

- (void)flowCover:(FlowCoverView *)view didSelect:(int)index
{
	//NSLog(@"Selected Index %d", index);
}

- (void) dealloc {
	[images release];
	[matchName release];
	[super dealloc];
}

@end
