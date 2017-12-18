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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController {
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true) {
            print("close")
        }
    }
}
