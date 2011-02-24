//
//  MatchDetailViewController.h
//  ATP Calendar
//
//  Created by James Wang on 4/17/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Match;

@interface MatchDetailViewController : UIViewController {
	Match *match;
	UILabel *nameLabel;
	UIImageView *imageView;
	UILabel *dateLabel;
	UILabel *tournamentLabel;
	UILabel *surfaceLabel;
	UILabel *prizeMoneyLabel;
	UILabel *drawLabel;
	UIButton *websiteButton;
	UILabel *ticketInfoLabel;
	UILabel *singleWinnerLabel;
	UILabel *doubleWinnersLabel;
}
@property (nonatomic, retain) Match *match;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *tournamentLabel;
@property (nonatomic, retain) IBOutlet UILabel *surfaceLabel;
@property (nonatomic, retain) IBOutlet UILabel *prizeMoneyLabel;
@property (nonatomic, retain) IBOutlet UILabel *drawLabel;
@property (nonatomic, retain) IBOutlet UIButton *websiteButton;
@property (nonatomic, retain) IBOutlet UILabel *ticketInfoLabel;
@property (nonatomic, retain) IBOutlet UILabel *singleWinnerLabel;
@property (nonatomic, retain) IBOutlet UILabel *doubleWinnersLabel;

- (IBAction)showPictures:(id)sender;
- (IBAction)hyperlinkPressed:(id)sender;

@end
