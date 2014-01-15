//
//  WriteReviewController.h
//  Cosplaying
//
//  Created by Hello Baby on 9/16/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCRatingView.h"
#import "TextViewWithPlaceholder.h"//;

@interface WriteReviewController : UIViewController <SCRatingDelegate, UITextViewDelegate, UITextFieldDelegate> {

	UIScrollView *scrollView;
	SCRatingView *ratingView;
	UILabel *ratingLabel;
	UITextField *reviewerTextField;
	UITextField *characterNameTextField;
	UITextField *keywordsTextField;
	TextViewWithPlaceholder *commentTextView;
	UIBarItem *sendButton;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet SCRatingView *ratingView;
@property (nonatomic, retain) IBOutlet UILabel *ratingLabel;
@property (nonatomic, retain) IBOutlet UITextField *reviewerTextField;
@property (nonatomic, retain) IBOutlet UITextField *characterNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *keywordsTextField;
@property (nonatomic, retain) IBOutlet TextViewWithPlaceholder *commentTextView;
@property (nonatomic, retain) IBOutlet UIBarItem *sendButton;


- (IBAction)back;
- (IBAction)sendReview;
- (IBAction)textValueChanged:(id) sender;

@end
