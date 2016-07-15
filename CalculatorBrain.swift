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
        "√"  : Operation.UnaryOperation(sqrt),  //sqrt(<#T##Double#>),
        //Here we have to put a function that takes a double and returns a double
        "cos" : Operation.UnaryOperation(cos) //cos(<#T##Double#>)
        //passing it here too
    ]
    
    func performOperation (symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant (let associativeValue):
                accumulator = associativeValue
            case .BinaryOperation : break
                //We also have to pass associativeValue here too
            case .UnaryOperation (let associativeFunction) :
                accumulator = associativeFunction(accumulator)
                
            case .Equals : break
            }
        }
    }
    
    
    
    enum Operation {
        case Constant(Double)
        //to do the unary operation, we have to parse a function as the associative value
        case UnaryOperation((Double) -> Double)
        //It takes a function that takes a double and returns a double
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
