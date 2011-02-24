//
//  SingleImageController.m
//  Cosplaying
//
//  Created by James Wang on 8/29/10.
//  Copyright 2010 Freeze!. All rights reserved.
//

#import "SingleImageController.h"
#import "NSObject-Dialog.h"
#import "AnimationDefinition.h"
#import "UINavigationController-Animation.h"
#import "ImageInformationController.h"

@implementation SingleImageController
@synthesize imageView;
@synthesize scrollView;
@synthesize image;
@synthesize progressView;
@synthesize progressLabel;


#pragma mark -
#pragma mark UIViewController Delegate Methods

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 436)];
	self.imageView.image = self.image;
	[self.scrollView addSubview:imageView];
	[super viewDidLoad];
}

- (void)viewDidUnload {
	imageView = nil;
	scrollView = nil;
	image = nil;
	progressView = nil;
	progressLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void)dealloc {
	[imageView release];
	[scrollView release];
	[image release];
	[progressView release];
	[progressLabel release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (UIView *) viewForZoomingInScrollView: (UIScrollView *) scrollView {
	return self.imageView;
}

- (void) scrollViewDidEndZooming: (UIScrollView *) scrollView withView: (UIView *) view atScale: (float) scale {
	CGAffineTransform transform = CGAffineTransformIdentity;
	transform = CGAffineTransformScale(transform, scale, scale);
	view.transform = transform;
}

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)back:(id) sender {	
	AnimationDefinition *animationDefinition = [[AnimationDefinition alloc] 
												initWithTransition:UIViewAnimationTransitionCurlUp
												curve:UIViewAnimationCurveEaseInOut
												duration:1];
	[self.navigationController popViewControllerWithAnimation:animationDefinition];
	[animationDefinition release];
}

- (IBAction)viewInformation:(id)sender {
	ImageInformationController *imageInformationController = [[ImageInformationController alloc] initWithNibName:@"ImageInformationController" bundle:nil];
	AnimationDefinition *animationDefinition = [[AnimationDefinition alloc] 
												initWithTransition:UIViewAnimationTransitionCurlDown
												curve:UIViewAnimationCurveEaseInOut
												duration:1];
	[self.navigationController pushViewController:imageInformationController withAnimation:animationDefinition];
	[imageInformationController release];
	[animationDefinition release];
}

- (void)image:(UIImage *)theImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
	self.imageView.alpha = 1.0f;
	self.progressView.hidden = YES;
	self.progressLabel.hidden = YES;
    if (error != NULL) {
		[[NSString stringWithFormat:@"Failed to save image due to: \n %@", error] showInDialogWithTitle:@"Oops! Error"];
	} else {
		[@"To see the saved image, simply open app \"Photos\", thanks:)" showInDialogWithTitle:@"Success"];
	}
}

- (void)increaseProgress {
	progress += 10.0f;
	self.progressView.progress = progress / 100.0f;
}

- (IBAction) saveImage {
	self.imageView.alpha = 0.6f;
	self.progressView.progress = 0.0f;
	self.progressView.hidden = NO;
	self.progressLabel.hidden = NO;
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
	UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

@end
