//
//  ViewController.swift
//  IOSCalculator
//
//  Created by spykins on 13/06/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
        Our UI.... What we need to do is to fix the UI so that when it's in portrait, It is using the whole available space.. When in landscape, the button covers the whole screen
     
     To do that,  We will take each of the button row eg (π789) and put them in a little stack
     THen take the whole column of 5 stacks and stack them together..
     
     Then we will stack the whole thing with Textview ...And create stack of stack
     
     Then we will bind the left top right and bottom edges of the whole thing to the outer edges of the UI
     
     That way when the outer edges of the UI changes, that thing will change and the stack will realocate the space
     
     To Make stack
     1. Select things you want to stack
     2. Go to Editor >> Embed In > Stack View
     
     Now to change the attricute, Select the stack view, go to attribute inspector
     change spacing to 10
     Distributed space equally
     
     After stacking the whole view
     Place it in the highlight left corner, Now, anchor it
     press the control key, drag from the stack container to the outer container by adding constrain
     
     To know whaht you are selecting
     Control Shift click
     
    */

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

