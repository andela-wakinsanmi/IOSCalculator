//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

class CalculatorBrain {
    func setOperand (operand : Double) {}
    func performOperation (symbol : String) {}
    
    //Placing get inside the result, makes it read only.. So client can't set it
    var result : Double {
        get{
           return 0.0
        }
    }
}
