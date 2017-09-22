//
//  Color.swift
//  BuzzLoopProject
//
//  Created by Abhiram Dinesh on 9/20/17.
//  Copyright © 2017 Abhiram Dinesh. All rights reserved.
//

import UIKit


class Color: NSObject {
    
    var colorName = ""
    var color = UIColor.white
    var text : String?
    

    //initialize color using json value
    init?(json : [String : Any]) {
    if let name = json["name"] as? String,
        let r = json["r"] as? Int, let g = json["g"] as? Int, let b = json["b"] as? Int {
        self.colorName = name
        self.color = UIColor(red: r,green: g,blue: b)
        }
    }
    

}

//convenience initializer for uicolor with int rgb values
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
