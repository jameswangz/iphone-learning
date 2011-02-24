//
//  AnimationDefinition.m
//  Cosplaying
//
//  Created by James Wang on 8/30/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "AnimationDefinition.h"

@implementation AnimationDefinition
@synthesize transition;
@synthesize curve;
@synthesize duration;

- (id)initWithTransition:(UIViewAnimationTransition) theTransition curve:(UIViewAnimationCurve) theCurve duration:(NSTimeInterval) theDuration {
	if (self = [super init]) {
		self.transition = theTransition;
		self.curve = theCurve;
		self.duration = theDuration;
	}
	return self;
}

@end
