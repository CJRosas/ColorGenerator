//
//  ViewController.swift
//  ColorGenerator
//
//  Created by CJ Rosas on 3/24/21.
//

import UIKit

// Produces random CGFloats in the range 0 to 1
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

// Generates random color
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .random()
    }
    
    
    
    @IBAction func changeColor(_ sender: Any) {
        self.view.backgroundColor = .random()
    }
    

}

