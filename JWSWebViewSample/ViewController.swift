//
//  ViewController.swift
//  JWSWebViewSample
//
//  Created by ClintJang on 2017. 12. 11..
//  Copyright © 2017년 ClintJang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

}

extension UIViewController {
    @IBAction func changedValueURLSwitch(_ sender: UISwitch) {
        appDelegate.isURL = sender.isOn
    }
}

extension UIViewController {
    /// common close function
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true) {
            print("self's controller close")
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
