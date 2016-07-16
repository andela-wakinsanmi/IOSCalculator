//
//  ViewController.swift
//  IOSCalculator
//
//  Created by spykins on 13/06/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    private var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()

    @IBAction private func touchDigit(sender: UIButton) {
        if let check = sender.currentTitle {
            let textCurrentlyInDisplay = display.text!
            if userIsInTheMiddleOfTyping {
                display.text = textCurrentlyInDisplay + check
            } else {
                display.text = check
                userIsInTheMiddleOfTyping = true
            }
        }
        
    }
    
    private var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
            //newValue is a swift keyword to mean the newValue being set
        }
    }
    

    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false;
        }
        if let mathematicalSymbol = sender.currentTitle {
           brain.performOperation(mathematicalSymbol)
        }
    
        displayValue = brain.result
    }
}

