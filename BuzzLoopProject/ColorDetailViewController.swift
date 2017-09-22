//
//  ColorDetailViewController.swift
//  BuzzLoopProject
//
//  Created by Abhiram Dinesh on 9/21/17.
//  Copyright © 2017 Abhiram Dinesh. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController, UITextFieldDelegate {
    
    //color item
    var color : Color?
    //table index
    var index : Int?

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set textfield delegate
        self.textField.delegate = self
        
        //set title as color name
        self.navigationItem.title = color?.colorName
        
        //set background color
        self.backgroundView.backgroundColor = color?.color
        
        //set textfield text is not nil
        if (color?.text != nil ) {
            self.textField.text = color?.text
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //hide keyboard when tapped on screen
        self.view.endEditing(true)
    }
    
    // MARK: - TextField Delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide keyboard when return key is tapped
        textField.resignFirstResponder()
        return true
    }

}
