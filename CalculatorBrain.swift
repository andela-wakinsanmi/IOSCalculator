//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

//This is a global function

func multiply(op1 : Double , op2 : Double ) -> Double {
    return op1 * op2
}

class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand (operand : Double) {
        accumulator = operand
    }
    
    private var operations : Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√"  : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation(multiply),
        "=" : Operation.Equals
        
        //We give it a function that doesnot exist yet, we have to go write that
    ]
    
    
    func performOperation (symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant (let associativeValue):
                accumulator = associativeValue
            case .BinaryOperation (let function) :
                //accumulator = function()
                break;
            case .UnaryOperation (let associativeFunction) :
                accumulator = associativeFunction(accumulator)
                
            case .Equals : break
            }
        }
    }
    
    
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
        var result : Double {
        get{
            return accumulator
        }
    }
}
