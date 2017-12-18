//
//  SwiftWKWebViewController.swift
//  JWSWebViewSample
//
//  Created by ClintJang on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import Foundation
import WebKit

/**
 The "WKWebView" test screen controller class implemented in the language "swift".
 - class : SwiftWKWebViewController
 */
class SwiftWKWebViewController : UIViewController {
    @IBOutlet weak var safeAreaContainerView: UIView!
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializes
        initLayout()
        
        loadURL()
    }
}

// MARK:- init
extension SwiftWKWebViewController {
    func initLayout() {
        self.webView = WKWebView(frame:self.safeAreaContainerView.bounds)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.safeAreaContainerView.addSubview(self.webView)
        
        // WKWebView Layout Setting
        // Constraints like "UIWebView" are set.
        // This is a sample. If you are developing, use a library called "SnapKit".
        // https://github.com/SnapKit/SnapKit
        let margins = safeAreaContainerView.layoutMarginsGuide
        webView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    func loadURL() {
        if appDelegate.isURL == true {
            guard let url = appDelegate.url else {
                return
            }
            let request = URLRequest(url: url)
            self.webView.load(request)
        } else {
            guard let  url = Bundle.main.url(forResource: "sample", withExtension: "html") else {
                return
            }
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
