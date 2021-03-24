//
//  ViewController.swift
//  ColorGenerator
//
//  Created by CJ Rosas on 3/24/21.
//

import UIKit


extension CGFloat {
    // Produces random CGFloats in the range 0 to 1
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    //Random color generator
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
    //Extrapolates the hex number of a UIColor
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
    
    //Formats the hex number of a UIColor into a displayable string
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
    
    //Label: Displays the hex number of the app background color
    @IBOutlet weak var ColorInfoDisplay: UILabel!
    
    //Text for the ColorInfoDisplay label
    var txt = " "
    
    //Random color variable for app background
    var color = UIColor.random()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = color
        txt = color.toHexString().uppercased()
        txt.remove(at: txt.startIndex)
        showText()
    }
    
    //On screen tap, background color changes and the new hex is displayed
    @IBAction func changeColor(_ sender: Any) {
        color = .random()
        self.view.backgroundColor = color
        txt = color.toHexString().uppercased()
        txt.remove(at: txt.startIndex)
        showText()
    }
    
    //Helper function, sets text in ColorInfoDisplay label
    func showText() {
        ColorInfoDisplay.text = txt
    }
    
    
}

