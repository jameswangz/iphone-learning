//
//  MatchWebViewController.m
//  ATP Calendar
//
//  Created by James Wang on 4/25/10.
//  Copyright 2010 DerbySoft. All rights reserved.
//

#import "MatchWebViewController.h"
#import "NSObject-Dialog.h";

@implementation MatchWebViewController
@synthesize url;
@synthesize webView;

- (void)viewDidLoad {
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
	[webView loadRequest:request];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}


- (void)viewDidUnload {
	self.url = nil;
	self.webView = nil;
	[super viewDidLoad];
}

- (void)dealloc {
	[self.url release];
	[self.webView release];
	[super dealloc];
}

#pragma mark -
#pragma mark UIWebViewDelegate Methods

- (void)webViewDidStartLoad:(UIWebView *)theWebView {
}

- (void)webViewDidFinishLoad:(UIWebView *)theWebView {
	self.title = self.url;
}

- (void)webView:(UIWebView *)theWebView didFailLoadWithError:(NSError *)error {
	self.title = @"Load failed, Please back";
	[error.localizedDescription showInDialog];
}

@end
