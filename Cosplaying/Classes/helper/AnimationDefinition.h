//
//  AnimationDefinition.h
//  Cosplaying
//
//  Created by James Wang on 8/30/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AnimationDefinition : NSObject {
	UIViewAnimationTransition transition;
	UIViewAnimationCurve curve;
	NSTimeInterval duration;
}

@property (nonatomic, assign) UIViewAnimationTransition transition;
@property (nonatomic, assign) UIViewAnimationCurve curve;
@property (nonatomic, assign) NSTimeInterval duration;

- (id)initWithTransition:(UIViewAnimationTransition) theTransition curve:(UIViewAnimationCurve) theCurve duration:(NSTimeInterval) theDuration;

@end
