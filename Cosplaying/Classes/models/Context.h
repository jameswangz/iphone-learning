//
//  Context.h
//  Cosplaying
//
//  Created by James Wang on 9/22/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Context : NSObject {

	NSString *activeImageKey;
	NSString *keyword;
	
}

@property (nonatomic, retain) NSString *activeImageKey;
@property (nonatomic, retain) NSString *keyword;

+ (id)contextWithActiveImageKey:(NSString *) theKey;

@end
