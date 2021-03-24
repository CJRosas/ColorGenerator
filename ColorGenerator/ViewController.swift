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

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var ColorInfoDisplay: UILabel!
    
    var txt = " "
    var color = UIColor.random()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .random()
        txt = color.toHexString().uppercased()
        txt.remove(at: txt.startIndex)
        showText()
    }
    
    
    
    @IBAction func changeColor(_ sender: Any) {
        color = .random()
        self.view.backgroundColor = color
        txt = color.toHexString().uppercased()
        txt.remove(at: txt.startIndex)
        showText()
    }
    
    func showText() {
        ColorInfoDisplay.text = txt
    }
    
    
}

