//
//  FirstViewController.swift
//  HelloTabs
//
//  Created by Jason Noble on 1/31/16.
//  Copyright © 2016 Jason Noble. All rights reserved.
//

import UIKit

let pi = M_PI

class FirstViewController: UIViewController {
    
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextView!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputTextField.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        radiusTextField.delegate = self
        goButton.userInteractionEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func diameterFromRadius(radius:Double) -> Double {
        return 2.0 * radius
    }
    
    func circumfrenceFromRadius(radius:Double) -> Double {
        return diameterFromRadius(radius) * pi
    }
    
    func areaFromRadius(radius:Double) -> Double {
        return pi * pow(radius, 2)
    }
    
    @IBAction func goBottonTouched(sender: UIButton) {
        let radius = Double(radiusTextField.text!)
        
        if let radius = radius {
            var string = "Diameter \(diameterFromRadius(radius))\n"
            string += "Circumference \(circumfrenceFromRadius(radius))\n"
            string += "Area \(areaFromRadius(radius))\n"
            outputTextField.text = string
        } else {
            outputTextField.text = "Enter a radius above"
        }
        radiusTextField.resignFirstResponder()
    }
    
}

extension FirstViewController: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
      goButton.userInteractionEnabled = !string.isEmpty
        return true
    }
}




