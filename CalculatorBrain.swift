//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

//Not optional is an enum .. which is probably declared like this
enum Optional<T> {
    case NONE
    case Some(T)
    //Associating value T with the constant T
}

class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand (operand : Double) {
        accumulator = operand
    }
    
    private var operations : Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI), //M_PI,
        "e" : Operation.Constant(M_E), //M_E,
        "√"  : Operation.UnaryOperation,  //sqrt(<#T##Double#>),
        "cos" : Operation.UnaryOperation //cos(<#T##Double#>)
    ]
    
    func performOperation (symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant: break;
            case .BinaryOperation : break;
            case .UnaryOperation : break;
            case .Equals : break;
            }
        }
    }
    
    
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation
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
