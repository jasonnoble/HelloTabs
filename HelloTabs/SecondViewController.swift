//
//  SecondViewController.swift
//  HelloTabs
//
//  Created by Jason Noble on 1/31/16.
//  Copyright © 2016 Jason Noble. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTextView.text = ""
        // Do any additional setup after loading the view, typically from a nib.
      widthTextField.delegate = self
      heightTextField.delegate = self
      goButton.userInteractionEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func perimeterFromWidthAndHeight(width:Double, height:Double) -> Double {
        return 2 * (width + height)
    }
    
    func areaFromWidthAndHeight(width:Double, height: Double) -> Double {
        return width * height
    }
    
    @IBAction func goButtonTouched(sender: UIButton) {
        
        if let width = Double(widthTextField.text!),
            let height = Double(heightTextField.text!) {
                
                var string = "Perimeter: \(perimeterFromWidthAndHeight(width, height: height))\n"
                string += "Area \(areaFromWidthAndHeight(width, height: height))\n"
                resultsTextView.text = string
        } else {
            resultsTextView.text = "Enter a width and height above"
        }
        widthTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
    }
    
}

extension SecondViewController: UITextFieldDelegate {
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    if let width = textField == widthTextField ? string : widthTextField.text,
       let height = textField == heightTextField ? string : heightTextField.text {
      goButton.userInteractionEnabled = !width.isEmpty && !height.isEmpty
    }
    return true
  }
}

