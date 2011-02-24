//
//  UINavigationViewController-Animation.m
//  Cosplaying
//
//  Created by James Wang on 8/30/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "UINavigationController-Animation.h"
#import "AnimationDefinition.h"


@implementation UINavigationController (Animation)

- (void)pushViewController:(UIViewController *)viewController withAnimation:(AnimationDefinition *) animationDefinition {
	[UIView beginAnimations:@"Navigation View Flip" context:nil];
	[UIView setAnimationDuration:animationDefinition.duration];
	[UIView setAnimationCurve:animationDefinition.curve];
	[UIView setAnimationTransition:animationDefinition.transition forView:self.view cache:YES];
	[self pushViewController:viewController animated:NO];
	[UIView commitAnimations];
}

- (void)popViewControllerWithAnimation:(AnimationDefinition *) animationDefinition {
	[UIView beginAnimations:@"Navigation View Flip" context:nil];
	[UIView setAnimationDuration:animationDefinition.duration];
	[UIView setAnimationCurve:animationDefinition.curve];
	[UIView setAnimationTransition:animationDefinition.transition forView:self.view cache:YES];
	[self popViewControllerAnimated:NO];
	[UIView commitAnimations];	
}

@end
