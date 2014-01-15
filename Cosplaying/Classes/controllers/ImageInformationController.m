//
//  ImageInformationController.m
//  Cosplaying
//
//  Created by Hello Baby on 9/16/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "ImageInformationController.h"
#import "WriteReviewController.h"
#import "UITableView-WithCell.h"
#import "NSObject-Dialog.h"
#import "CosplayingAppDelegate.h"
#import "Configuration.h"
#import "JSON.h"
#import "RatingCellView.h"
#import "UINavigationController-Animation.h"
#import "AnimationDefinition.h"
#import "ASIHTTPRequest.h"

@implementation ImageInformationController
@synthesize reviewsView;
@synthesize titleBarItem;



- (NSArray *) requestNewData:(BOOL) withHeader {
	CosplayingAppDelegate *delegate = (CosplayingAppDelegate *) [[UIApplication sharedApplication] delegate];
	NSString *imageKey = delegate.context.activeImageKey;
	NSString *url = [[NSString stringWithFormat:@"%@/reviews?image_key=%@&with_header=%d&offset=%d", SERVICE_URL, imageKey, withHeader, offset] 
					 stringByAddingPercentEscapesUsingEncoding:NSStringEncodingConversionExternalRepresentation];
	
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
	[request startSynchronous];
	NSString *response = [request responseString];
	NSArray *jsonArray = [response JSONValue];
	return jsonArray;
}

- (void)initializeDataArray {
	offset = 0;
	array = [[NSMutableArray alloc] init];
	[array addObjectsFromArray:[self requestNewData:YES]];
}

- (UIButton *)moreReviewsButton {
	moreReviews = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	moreReviews.frame = CGRectMake(0, 0, 320, 50); 	
	[moreReviews setTitle:@"MoreReviews..." forState:UIControlStateNormal];
	[moreReviews addTarget:self action:@selector(loadMoreReviews) forControlEvents:UIControlEventTouchUpInside];
	return moreReviews;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	[self initializeDataArray];
	if ([array count] == 0) {
		[@"Couldn't load reviews from server, please check your internet connection." showInDialogWithTitle:@"Oops! Error"];
		return;
	}
	NSDictionary *dict = [array objectAtIndex:0];
	self.titleBarItem.title = [NSString stringWithFormat:@"Reviews (%@)", [dict valueForKey:@"reviewed_times"]];
	[self.reviewsView reloadData];
	self.reviewsView.tableFooterView = [self moreReviewsButton];
}

- (void)viewWillDisappear:(BOOL)animated {
	[array release];
}


- (void)viewDidUnload {
    array = nil;
	reviewsView = nil;
	titleBarItem = nil;
	moreReviews = nil;
	[super viewDidUnload];
}


- (void)dealloc {
//	[reviewsView release];
	[titleBarItem release];
	[moreReviews release];
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)back {
	AnimationDefinition *animationDefinition = [[AnimationDefinition alloc] 
												initWithTransition:UIViewAnimationTransitionCurlUp
												curve:UIViewAnimationCurveEaseInOut
												duration:1];
	[self.navigationController popViewControllerWithAnimation:animationDefinition];
	[animationDefinition release];
}

- (IBAction)writeReview:(id) sender {
	WriteReviewController *writeReviewController = [[WriteReviewController alloc] initWithNibName:@"WriteReviewController" bundle:nil];
	AnimationDefinition *animationDefinition = [[AnimationDefinition alloc] 
												initWithTransition:UIViewAnimationTransitionCurlDown
												curve:UIViewAnimationCurveEaseInOut
												duration:1];
	
	[self.navigationController pushViewController:writeReviewController withAnimation:animationDefinition];
	[writeReviewController release];
	[animationDefinition release];
}

- (IBAction)loadMoreReviews {
	[moreReviews setTitle:@"Loading..." forState:UIControlStateNormal];
	NSInteger rowsBeforeRequest = [array count] - 1;
	offset = [array count] - 1;
	if (offset < 0) {
		offset = 0;
	}
	NSArray *jsonArray = [self requestNewData:NO];
	[array addObjectsFromArray:jsonArray];
	int responseCount = [jsonArray count];		
	if (responseCount > 0) {
		NSMutableArray *insertIndexPaths = [[NSMutableArray alloc] initWithCapacity:responseCount];
		
		for (int i = 0; i < responseCount; i++) {
			[insertIndexPaths addObject:[NSIndexPath indexPathForRow:++rowsBeforeRequest inSection:0]];
		}
		
		[self.reviewsView beginUpdates];
		[self.reviewsView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationBottom];
		[self.reviewsView endUpdates];
		[insertIndexPaths release];
	}
	[moreReviews setTitle:@"MoreReviews..." forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [array count];
}

- (NSString *)mark:(NSString *)source {
	CosplayingAppDelegate *delegate = (CosplayingAppDelegate *) [[UIApplication sharedApplication] delegate];
	NSString *keyword = delegate.context.keyword;
	
	NSRange range = [source rangeOfString:keyword];
	if (range.location == NSNotFound) {
		return source;
	}
	return [source stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"<%@>", keyword]];
}

- (CGFloat)heightOfComment:(NSIndexPath *) indexPath maxWidth:(CGFloat) maxWidth {
	NSDictionary *dict = [array objectAtIndex:[indexPath row]];
	NSString *commentValue = [dict valueForKey:@"comment"];
	if ([commentValue length] == 0) {
		return 0;
	} 
	UIFont *font = [UIFont systemFontOfSize:12];
	CGSize size =  [commentValue sizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, MAXFLOAT) lineBreakMode:UILineBreakModeCharacterWrap];
	return size.height + 20;
}

- (UIColor *) colorOf:(int) row {
	int mod = row % 2;
	if (mod == 1) {
		return [[[UIColor alloc] initWithRed:0.6 green:0.8	blue:0.8 alpha:1.0] autorelease];
	} 
	return [[[UIColor alloc] initWithRed:200 green:200	blue:200 alpha:1.0] autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
	NSUInteger row = [indexPath row];
	if (row == 0) {
		cell = [tableView dequeueOrInit:@"HeaderCell" withStyle:UITableViewCellStyleSubtitle];

		NSDictionary *dict = [array objectAtIndex:row];
		
		UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
		date.text = [NSString stringWithFormat:@"Upload date %@", [dict valueForKey:@"folder"]];
		[cell.contentView addSubview:date];
		[date release];
		
		UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 20)];
		title.text = [NSString stringWithFormat:@"Average of %@ ratings", [dict valueForKey:@"reviewed_times"]];
		[cell.contentView addSubview:title];
		[title release];
		
		RatingCellView *ratingCellView = [[RatingCellView alloc] initWithFrame:CGRectMake(10, 50, 50, 20)];
		ratingCellView.rating = [[dict valueForKey:@"average_rate"] floatValue];
		[cell.contentView addSubview:ratingCellView];
		[ratingCellView release];
	} else {
		NSDictionary *dict = [array objectAtIndex:row];
		UIColor *bgColor = [self colorOf:row];
		static NSString *identifier = @"ReviewCell";
		cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
			
			UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
			title.tag = -1;
			[cell.contentView addSubview:title];
			[title release];
			
			RatingCellView *ratingCellView = [[RatingCellView alloc] initWithFrame:CGRectMake(10, 30, 50, 20)];
			ratingCellView.tag = -2;
			[cell.contentView addSubview:ratingCellView];
			[ratingCellView release];
			
			UILabel *reviewer = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 300, 20)];
			reviewer.tag = -3;
			reviewer.textColor = [UIColor grayColor];
			reviewer.font = [UIFont systemFontOfSize:12]; 
			[cell.contentView addSubview:reviewer];
			[reviewer release];
			
			UILabel *keywords = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 20)];
			keywords.tag = -4;
			keywords.textColor = [UIColor grayColor];
			keywords.font = [UIFont systemFontOfSize:12]; 
			[cell.contentView addSubview:keywords];
			[keywords release];
			
			UILabel *comment = [[UILabel alloc] init];
			comment.tag = -5;
			comment.numberOfLines = 0; 
			comment.textColor = [UIColor grayColor];
			comment.font = [UIFont systemFontOfSize:12]; 
			[cell.contentView addSubview:comment];
			[comment release];		
		}
		
		UILabel *title = (UILabel *) [cell.contentView viewWithTag:-1];
		title.text = [NSString stringWithFormat:@"%d. %@", [indexPath row], [self mark:[dict valueForKey:@"character_name"]]];
		title.backgroundColor = bgColor;
		
		RatingCellView *ratingCellView = (RatingCellView *) [cell.contentView viewWithTag:-2];;
		ratingCellView.rating = [[dict valueForKey:@"rate"] floatValue];
		ratingCellView.backgroundColor = bgColor;
		
		UILabel *reviewer = (UILabel *) [cell.contentView viewWithTag:-3];
		reviewer.text = [NSString stringWithFormat:@"by %@ at %@", 
						 [self mark:[dict valueForKey:@"reviewer"]],
						 [dict valueForKey:@"created_at"]];
		reviewer.backgroundColor = bgColor;
		
		UILabel *keywords = (UILabel *) [cell.contentView viewWithTag:-4];
		keywords.text = [NSString stringWithFormat:@"Keywords: %@", [self mark:[dict valueForKey:@"keywords"]]];
		keywords.backgroundColor = bgColor;
		
		UILabel *comment = (UILabel *) [cell.contentView viewWithTag:-5];
		CGFloat maxWidth = 300;
		CGFloat height = [self heightOfComment:indexPath maxWidth:maxWidth];
		comment.frame = CGRectMake(10, 70, maxWidth, height);
		comment.backgroundColor = bgColor;
		comment.text = [dict valueForKey:@"comment"];
		
		cell.contentView.backgroundColor = bgColor;
	}

	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate Methods

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	int row = [indexPath row];
	if (row == 0) {
		return 80;
	}
	
	CGFloat commentHeight = [self heightOfComment:indexPath maxWidth:300];
	return commentHeight + 70;
}

@end
