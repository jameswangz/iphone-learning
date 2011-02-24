//
//  SingleImageController.h
//  Cosplaying
//
//  Created by James Wang on 8/29/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleImageController : UIViewController <UIScrollViewDelegate> {
	UIImageView *imageView;
	UIScrollView *scrollView;
	UIImage *image;
	UIProgressView *progressView;
	float progress;
	UILabel *progressLabel;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UILabel *progressLabel;


- (IBAction)back:(id) sender;
- (IBAction)viewInformation:(id) sender;
- (IBAction)saveImage;
@end
