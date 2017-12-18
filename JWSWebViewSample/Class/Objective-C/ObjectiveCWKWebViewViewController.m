//
//  ObjectiveCWKWebViewViewController.m
//  JWSWebViewSample
//
//  Created by ClintJang on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

#import "ObjectiveCWKWebViewViewController.h"
#import "JWSWebViewSample-Swift.h"

@import WebKit;

@interface ObjectiveCWKWebViewViewController ()
@property (weak, nonatomic) IBOutlet UIView *safeAreaContainerView;     // It contains "View" that reflects "Self Area" function.
@property (strong, nonatomic) WKWebView *webView;
@end

@interface ObjectiveCWKWebViewViewController (webkit) <WKUIDelegate, WKNavigationDelegate>
@end

@implementation ObjectiveCWKWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initializes
    [self initLayout];
    
    [self loadURL];
}

/**
 @brief This function initializes the layout.
 */
- (void)initLayout {
    CGRect rect = CGRectMake(0.0, 0.0, self.safeAreaContainerView.frame.size.width, self.safeAreaContainerView.frame.size.height);
    self.webView = [[WKWebView alloc] initWithFrame:rect];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.safeAreaContainerView addSubview:self.webView];
    

    // WKWebView Layout Setting
    // Constraints like "UIWebView" are set.
    NSLayoutConstraint *firstViewConstraintTop = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.safeAreaContainerView attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
    
    NSLayoutConstraint *firstViewConstraintBottom = [NSLayoutConstraint constraintWithItem:self.safeAreaContainerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.webView attribute:NSLayoutAttributeBottom multiplier:1.f constant:0];
    
    NSLayoutConstraint *firstViewConstraintLeadingSpace = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.safeAreaContainerView attribute:NSLayoutAttributeLeading multiplier:1.f constant:0];
    
    NSLayoutConstraint *firstViewConstraintTrailingSpace = [NSLayoutConstraint constraintWithItem:self.safeAreaContainerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.webView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:0];
    
    [self.safeAreaContainerView addConstraints:[NSArray arrayWithObjects: firstViewConstraintTop, firstViewConstraintBottom, firstViewConstraintLeadingSpace, firstViewConstraintTrailingSpace, nil]];
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

@implementation ObjectiveCWKWebViewViewController (webkit)
#pragma mark - WKWebView UIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    NSLog(@"%s", __FUNCTION__);

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        completionHandler();
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {

    NSLog(@"%s", __FUNCTION__);

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        completionHandler(YES);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        completionHandler(NO);
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler {

    NSLog(@"%s", __FUNCTION__);

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.text = defaultText;
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *input = ((UITextField *)alertController.textFields.firstObject).text;
        completionHandler(input);
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        completionHandler(nil);
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - WKWebView WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];


}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"%s", __FUNCTION__);

    // For URL Checking
    NSString *requestString = navigationAction.request.URL.absoluteString;
    NSLog(@"requestString : %@", requestString);
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
