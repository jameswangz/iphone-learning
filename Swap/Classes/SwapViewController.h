//
//  SwapViewController.h
//  Swap
//
//  Created by James Wang on 3/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface SwapViewController : UIViewController {
	UIView *landscape;
	UIView *portrait;
	
	// Foo
	UIButton *landscapeFooButton;
	UIButton *portraitFooButton;
	
	//Bar
	UIButton *landscapeBarButton;
	UIButton *portraitBarButton;
}

@property (nonatomic, retain) IBOutlet UIView *landscape;
@property (nonatomic, retain) IBOutlet UIView *portrait;
@property (nonatomic, retain) IBOutlet UIButton *landscapeFooButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitFooButton;
@property (nonatomic, retain) IBOutlet UIButton *landscapeBarButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitBarButton;

- (IBAction)buttonPressed:(id)sender;

@end

