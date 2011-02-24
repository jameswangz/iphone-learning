//
//  DisclosureDetailController.h
//  Nav
//
//  Created by Hello Baby on 4/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DisclosureDetailController : UIViewController {
	UILabel *label;
	NSString *message;
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) NSString *message;

@end
