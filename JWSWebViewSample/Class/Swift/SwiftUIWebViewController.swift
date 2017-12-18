//
//  SwiftUIWebViewController.swift
//  JWSWebViewSample
//
//  Created by ClintJang on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import Foundation

/**
 The "UIWebView" test screen controller class implemented in the language "swift".
 - class : SwiftUIWebViewController
 */
class SwiftUIWebViewController : UIViewController {
    @IBOutlet weak var safeAreaContainerView: UIView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializes
        initLayout()
        
        loadURL()
    }
}

// MARK:- init
extension SwiftUIWebViewController {
    func initLayout() {
        // I set it(webView) in "storyboard".
    }
    
    func loadURL() {
        if appDelegate.isURL == true {
            guard let url = appDelegate.url else {
                return
            }
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        } else {
            guard let  url = Bundle.main.url(forResource: "sample", withExtension: "html") else {
                return
            }
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }
    }
}

// MARK:- UIWebViewDelegate
extension SwiftUIWebViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("\(#function)")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("\(#function)")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("\(#function)")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("\(#function)")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

    }
}
