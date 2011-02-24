//
//  WriteReviewController.m
//  Cosplaying
//
//  Created by Hello Baby on 9/16/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "WriteReviewController.h"
#import "NSObject-Dialog.h"
#import "ASIFormDataRequest.h"
#import "Configuration.h"
#import "CosplayingAppDelegate.h"
#import "NSDataCache.h"
#import "AnimationDefinition.h"
#import "UINavigationController-Animation.h"

@implementation WriteReviewController
@synthesize scrollView;
@synthesize ratingView;
@synthesize ratingLabel;
@synthesize reviewerTextField;
@synthesize characterNameTextField;
@synthesize keywordsTextField;
@synthesize commentTextView;
@synthesize sendButton;


#pragma mark -
#pragma mark ViewController Methods

- (void) initRatingView {
	[ratingView setStarImage:[UIImage imageNamed:@"star-halfselected.png"] forState:kSCRatingViewHalfSelected];
	[ratingView setStarImage:[UIImage imageNamed:@"star-highlighted.png"] forState:kSCRatingViewHighlighted];
	[ratingView setStarImage:[UIImage imageNamed:@"star-hot.png"] forState:kSCRatingViewHot];
	[ratingView setStarImage:[UIImage imageNamed:@"star-nonselected.png"] forState:kSCRatingViewNonSelected];
	[ratingView setStarImage:[UIImage imageNamed:@"star-selected.png"] forState:kSCRatingViewSelected];
	[ratingView setStarImage:[UIImage imageNamed:@"star-userselected.png"] forState:kSCRatingViewUserSelected];
	ratingView.userRating = 3;
	ratingView.delegate = self;
}

- (void) initTextFields {
	self.reviewerTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_REVIEWER_KEY];
	self.commentTextView.placeholder = @"Write your comment here...";
	self.commentTextView.placeholderColor = [UIColor lightGrayColor];
}

- (void)saveReviewer {
	[[NSUserDefaults standardUserDefaults] setObject:self.reviewerTextField.text forKey:USER_DEFAULTS_REVIEWER_KEY];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initRatingView];
	[self initTextFields];
}


- (void)viewDidUnload {
    [super viewDidUnload];
	scrollView = nil;
	ratingView = nil;
	ratingLabel = nil;
	reviewerTextField = nil;
	characterNameTextField = nil;
	keywordsTextField = nil;
	commentTextView = nil;
	sendButton = nil;
}


- (void)dealloc {
    [super dealloc];
	[scrollView release];
	[ratingView release];
	[ratingLabel release];
	[reviewerTextField release];
	[characterNameTextField release];
	[keywordsTextField release];
	[commentTextView release];
	[sendButton release];
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

- (IBAction)sendReview {
	[self saveReviewer];
	NSString *rate = [NSString stringWithFormat:@"%d", self.ratingView.userRating];
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/reviews", SERVICE_URL]];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	CosplayingAppDelegate *delegate = (CosplayingAppDelegate *) [[UIApplication sharedApplication] delegate];
	[request addPostValue:delegate.context.activeImageKey forKey:@"image_key"];
	[request addPostValue:self.reviewerTextField.text forKey:@"reviewer"];
	[request addPostValue:rate forKey:@"rate"];
	[request addPostValue:self.characterNameTextField.text forKey:@"character_name"];
	[request addPostValue:self.keywordsTextField.text forKey:@"keywords"];
	[request addPostValue:self.commentTextView.text forKey:@"comment"];
	[request startSynchronous];
	
	[self back];
	
//	NSError *error = [request error];
//	if (!error) {
//		NSString *response = [request responseString];
//		[response showInDialog];
//	} else {
//		[error showInDialogWithTitle:@"Oops, Error"];
//	}
	
}

- (IBAction)textValueChanged:(id) sender {
	BOOL allNotNullFieldsHaveValue = [self.reviewerTextField.text length] > 0 
										&& [self.characterNameTextField.text length] > 0 
										&& [self.keywordsTextField.text length] > 0;

	self.sendButton.enabled = allNotNullFieldsHaveValue;
}

#pragma mark -
#pragma mark UITextFieldDelegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if (textField.text.length >= 50 && range.length == 0) {
		return NO;
	} else {
		return YES;
	}
}


#pragma mark -
#pragma mark SCRatingDelegate Methods

- (void)ratingView:(SCRatingView *)ratingView didChangeUserRatingFrom:(NSInteger)previousUserRating to:(NSInteger)userRating {
	self.ratingLabel.hidden = YES;
}

#pragma mark -
#pragma mark UITextViewDelegate Methods

- (void)textViewDidChange:(UITextView *)textView {
	int maxLenth = 300;
    if (textView.text.length >= maxLenth) {
        textView.text = [textView.text substringToIndex:maxLenth];
    }

	CGFloat height = textView.contentSize.height;

	CGSize size = self.scrollView.contentSize;
	size.height = 436 + height;
	self.scrollView.contentSize = size;	
	
	CGPoint scrollPoint = [self.scrollView contentOffset];
	scrollPoint.y = height - 40;
	if (scrollPoint.y < 0.0f) {
		scrollPoint.y = 0.0f;
	}
	[self.scrollView setContentOffset:scrollPoint animated:YES];	
}

@end
