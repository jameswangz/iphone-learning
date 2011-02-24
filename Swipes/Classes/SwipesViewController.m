//
//  SwipesViewController.m
//  Swipes
//
//  Created by James Wang on 2/22/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import "SwipesViewController.h"

@implementation SwipesViewController
@synthesize label;
@synthesize gestureStartPoint;

#pragma mark -
#pragma mark Touch Methods

- (CGPoint) currentPositionOf: (NSSet *) touches  {
  return [[touches anyObject] locationInView:self.view];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	gestureStartPoint = [self currentPositionOf: touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint currentPosition = [self currentPositionOf: touches];
	CGFloat deltaX = fabsf(currentPosition.x - gestureStartPoint.x);
	CGFloat deltaY = fabsf(currentPosition.y - gestureStartPoint.y);
		
	if (deltaX >= kMinimumGestureLength && deltaY <= kMaximumVariance) { 
		label.text = @"Horizontal swipe detected"; 
		[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
	}
	else if (deltaX <= kMaximumVariance && deltaY >= kMinimumGestureLength) {
		label.text = @"Vertical swipe detected";
		[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
	}
}

#pragma mark -
#pragma mark Business Methods

- (void)eraseText {
	self.label.text = @"";
}

#pragma mark -
#pragma mark Memory Management Methods


- (void)viewDidUnload {
	self.label = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[label release];
    [super dealloc];
}

@end
