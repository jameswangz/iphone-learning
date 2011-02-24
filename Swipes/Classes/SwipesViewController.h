//
//  SwipesViewController.h
//  Swipes
//
//  Created by James Wang on 2/22/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>

#define	kMinimumGestureLength	25
#define kMaximumVariance		5

@interface SwipesViewController : UIViewController {

	UILabel *label;
	CGPoint gestureStartPoint;
	
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic) CGPoint gestureStartPoint;

- (void)eraseText;


@end

