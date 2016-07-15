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
    
    private var operations : Dictionary<String, Double> = [
        "π" : M_PI,
        "e" : M_E
        "√"  : sqrt(<#T##Double#>)
    ]
    
    func performOperation (symbol : String) {
        if let constant = operations[symbol] {
            accumulator = constant
        }
    }
    
    enum operation {
        case Constant
        case UnaryOperatiom
        case BinaryOperation
        case Equals
    }
    
    
    //Placing get inside the result, makes it read only.. So client can't set it
    var result : Double {
        get{
            return accumulator
        }
    }
}
