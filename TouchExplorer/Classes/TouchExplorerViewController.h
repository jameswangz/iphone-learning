//
//  TouchExplorerViewController.h
//  TouchExplorer
//
//  Created by James Wang on 2/21/11.
//  Copyright 2011 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchExplorerViewController : UIViewController {

	UILabel *messageLabel;
	UILabel *tapsLabel;
	UILabel *touchesLabel;
	
}

@property (nonatomic, retain) IBOutlet UILabel *messageLabel;
@property (nonatomic, retain) IBOutlet UILabel *tapsLabel;
@property (nonatomic, retain) IBOutlet UILabel *touchesLabel;

- (void)updateLabelsFromTouches:(NSSet *)touches;

@end

