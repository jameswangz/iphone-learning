//
//  UIImageWithUniqueName.h
//  Cosplaying
//
//  Created by James Wang on 9/18/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImageWithKey : UIImage {

	NSString *key;
	
}

@property (nonatomic, retain) NSString *key;

@end
