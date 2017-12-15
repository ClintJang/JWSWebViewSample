//
//  ViewController.swift
//  JWSWebViewSample
//
//  Created by Jang Wangsu on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

extension ViewController {
    // MARK:- Objective-C
    @IBAction func showUIWebViewObjectiveC(_ sender: Any) {
        print("aaa")
    }
    
    @IBAction func showWKWebViewObjectiveC(_ sender: Any) {
        print("bbb")
    }
}

// MARK:- Swift
extension ViewController {
    @IBAction func showUIWebViewSwift(_ sender: Any) {
        print("ccc")
    }
    
    
    @IBAction func showWKWebViewSwift(_ sender: Any) {
        print("ddd")
    }
}
