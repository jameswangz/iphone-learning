//
//  MatchDetailViewController.m
//  ATP Calendar
//
//  Created by James Wang on 4/17/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "MatchDetailViewController.h"
#import "Match.h"
#import "MatchWebViewController.h"
#import "MatchImageCoverFlowViewController.h"
#import "Context.h"
#import "ATP_CalendarAppDelegate.h"
#import "MatchImageFlowCoverViewDelegate.h"
#import "NSObject-Dialog.h"

@implementation MatchDetailViewController
@synthesize match;
@synthesize nameLabel;
@synthesize dateLabel;
@synthesize tournamentLabel;
@synthesize surfaceLabel;
@synthesize prizeMoneyLabel;
@synthesize drawLabel;
@synthesize websiteButton;
@synthesize ticketInfoLabel;
@synthesize singleWinnerLabel;
@synthesize doubleWinnersLabel;
@synthesize imageView;

- (void)extractData {
	self.nameLabel.text = match.name;
	self.imageView.image = [match categoryImage];
	self.dateLabel.text = match.date;
	NSMutableString *tournament = [[NSMutableString alloc] init];
	[tournament appendString:match.city];
	if (match.country != nil && [match.country length] > 0) {
		[tournament appendFormat:@", %@", match.country];
	} 
	self.tournamentLabel.text = tournament;
	[tournament release];
	self.surfaceLabel.text = match.surface;
	NSMutableString *prizeMoney = [[NSMutableString alloc] init];
	if (match.prizeMoney != nil && [match.prizeMoney length] > 0) {
		[prizeMoney appendString:match.prizeMoney];
	}
	if (match.totalFinancialCommitment != nil && [match.totalFinancialCommitment length] >0) {
		[prizeMoney appendFormat:@" (%@)", match.totalFinancialCommitment];
	}
	self.prizeMoneyLabel.text = prizeMoney;
	[prizeMoney release];
	NSString *draw = [[NSString alloc] initWithFormat:@"SGL %d DBL %d", match.singleDraw, match.doubleDraw];
	self.drawLabel.text = draw;
	[draw release];
	[self.websiteButton setTitle:match.website forState:UIControlStateNormal];
	NSString *ticketInfo = nil;
	if (match.ticketEmail != nil && [match.ticketEmail length] > 0) {
		ticketInfo = [[NSString alloc] initWithFormat:@"%@ %@", match.ticketEmail, match.ticketPhone];
	} else {
		ticketInfo = [[NSString alloc] initWithFormat:@"%@", match.ticketPhone];
	}
	self.ticketInfoLabel.text = ticketInfo;
	[ticketInfo release];			  
	NSMutableString *winners = [[NSMutableString alloc] init];
	self.singleWinnerLabel.text = [NSString stringWithFormat:@"Singles : %@", match.singleWinner];
	self.doubleWinnersLabel.text = [NSString stringWithFormat:@"Doubles : %@", [match.doubleWinners componentsJoinedByString:@","]];
	[winners release];
}

- (void) addGalleryButton {
	UIBarButtonItem *galleryButton = [[UIBarButtonItem alloc] 
									   initWithTitle:@"Loading Gallery..." 
									   style:UIBarButtonItemStyleBordered 
									   target:nil 
									   action:nil];
	self.navigationItem.rightBarButtonItem = galleryButton;
	[galleryButton release];
}

- (void)loadGallery {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
	MatchImageFlowCoverViewDelegate *matchImageFlowCoverViewDelegate = [Context delegate].matchImageFlowCoverViewDelegate;
	
	//Actual load, this step is slow
	matchImageFlowCoverViewDelegate.matchName = self.match.name;
	
	if ([matchImageFlowCoverViewDelegate.images count] == 0) {
		self.navigationItem.rightBarButtonItem.title = @"No Gallery";
	} else {
		self.navigationItem.rightBarButtonItem.title = @"Gallery";
		self.navigationItem.rightBarButtonItem.target = self;
		self.navigationItem.rightBarButtonItem.action = @selector(showPictures:);
	}
	
    [pool release];
}

- (void)viewDidLoad {
	[self extractData];
	
	[self addGalleryButton];
	if ([Context networkStatus] == NotReachable) {
		self.navigationItem.rightBarButtonItem.title = @"No Internet Connection";
	} else {
		[self performSelectorInBackground:@selector(loadGallery) withObject:nil];
	}
	
	[super viewDidLoad];
}

- (IBAction)hyperlinkPressed:(id)sender {
	UIButton *button = (UIButton *)sender;
	NSString *currentTitle = button.currentTitle;
	if (currentTitle != nil) {
		MatchWebViewController *webViewController = [[MatchWebViewController alloc] initWithNibName:@"MatchWebView" bundle:nil];
		webViewController.title = @"Loading...";
		webViewController.url = currentTitle;
		[self.navigationController pushViewController:webViewController animated:YES];								
		[webViewController release];
	}
}

- (IBAction)showPictures:(id)sender {
	MatchImageCoverFlowViewController *coverFlowController = [[MatchImageCoverFlowViewController alloc] initWithNibName:@"MatchImageCoverFlowView" bundle:nil];
	FlowCoverView *flowCoverView = (FlowCoverView *) coverFlowController.view;
	flowCoverView.delegate = [Context delegate].matchImageFlowCoverViewDelegate;
	NSString *title = [[NSString alloc] initWithFormat:@"Gallery Of %@", match.name];
	coverFlowController.title = title;
	[title release];
	//[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
	[self.navigationController pushViewController:coverFlowController animated:YES];
	[coverFlowController release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)viewDidUnload {
	self.nameLabel = nil;
	self.imageView = nil;
	self.dateLabel = nil;
	self.tournamentLabel = nil;
	self.surfaceLabel = nil;
	self.prizeMoneyLabel = nil;
	self.drawLabel = nil;
	self.ticketInfoLabel = nil;
	self.singleWinnerLabel = nil;
	self.doubleWinnersLabel = nil;
	[super viewDidUnload];
}

- (void)dealloc {
	[self.nameLabel release];
	[self.imageView release];
	[self.dateLabel release];
	[self.tournamentLabel release];
	[self.surfaceLabel release];
	[self.prizeMoneyLabel release];
	[self.drawLabel release];
	[self.ticketInfoLabel release];
	[self.singleWinnerLabel release];
	[self.doubleWinnersLabel release];
	[super dealloc];
}

@end
