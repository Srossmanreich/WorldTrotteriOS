//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Sydney Rossman-Reich on 5/31/16.
//  Copyright © 2016 Sydney Rossman-Reich. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel(){
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRage range: NSRange, replacementString string: String) -> Bool {
       
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        let letters = NSCharacterSet.letterCharacterSet()
        
        let existingTextHasLetters = textField.text?.rangeOfString("\(letters)")
        
        let replacementTextHasLetters = textField.text?.rangeOfString("\(letters)")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else if existingTextHasLetters != nil && replacementTextHasLetters != nil {
            return false
        } else {
            return true
        }
        
    }
    
    @IBAction func fahrenheitFieldEditingChanges(textField: UITextField) {
        if let text = textField.text, value = Double(text){
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
}
