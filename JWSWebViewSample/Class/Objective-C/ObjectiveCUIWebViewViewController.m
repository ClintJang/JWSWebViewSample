//
//  ObjectiveCUIWebViewViewController.m
//  JWSWebViewSample
//
//  Created by ClintJang on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

#import "ObjectiveCUIWebViewViewController.h"
#import "JWSWebViewSample-Swift.h"

@interface ObjectiveCUIWebViewViewController ()
@property (weak, nonatomic) IBOutlet UIView *safeAreaContainerView;     // It contains "View" that reflects "Self Area" function.
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@interface ObjectiveCUIWebViewViewController (webview) <UIWebViewDelegate>
@end

@implementation ObjectiveCUIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initializes
    [self initLayout];
    
    [self loadURL];
}

#pragma mark - init
/**
 @brief This function initializes the layout.
 */
- (void)initLayout {
    // I set it(webView) in "storyboard".
}

/**
 @brief The function that loads the URL.
 */
- (void)loadURL {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([delegate isURL] == YES) {
        NSURL *url = [delegate url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    } else {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"html"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
    }
}
@end

#pragma mark - UIWebViewDelegate
@implementation ObjectiveCUIWebViewViewController (webview)
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s", __FUNCTION__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}
@end
