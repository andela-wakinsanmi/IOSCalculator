//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand (operand : Double) {
        accumulator = operand
    }
    
    func performOperation (symbol : String) {
        switch symbol {
        case "π" : accumulator = M_PI
        case "√" : accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    //Placing get inside the result, makes it read only.. So client can't set it
    var result : Double {
        get{
            return 0.0
        }
    }
}
