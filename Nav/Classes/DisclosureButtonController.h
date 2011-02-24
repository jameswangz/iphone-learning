//
//  DisclosureButtonController.h
//  Nav
//
//  Created by Hello Baby on 4/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"
@class DisclosureDetailController;

@interface DisclosureButtonController : SecondLevelViewController {
	NSArray *list;
	DisclosureDetailController *detailController;
}
@property (nonatomic, retain) NSArray *list;
@end
