//
//  UINavigationViewController-Animation.h
//  Cosplaying
//
//  Created by James Wang on 8/30/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AnimationDefinition;

@interface UINavigationController (Animation)

- (void)pushViewController:(UIViewController *)viewController withAnimation:(AnimationDefinition *) animationDefinition;
- (void)popViewControllerWithAnimation:(AnimationDefinition *) animationDefinition;

@end
