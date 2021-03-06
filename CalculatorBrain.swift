//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

//func multiply
/*
    We can start making each function for the other binary operation
 like subtract, divide, add ...
 We can use swift to do that because it implements closures... Closure is like an inline function.. It is an inline function that captures the state of it's environment
 Now... Take the function in the multiply above and paste it.. without the method name
 */

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
        "×" : Operation.BinaryOperation( {$0 * $1 }),
        //It can get better than that because closures can have default Arguments
        // The default argument names are $0, $1 , $2, $3 depending on how many Arguments you have {($0, $1) in return $0 * $1 }
        //If we do this, then we don't need the first part ($0, $1) in
        //Now we are left with {return $0 * $1 }
        //Since in the kind of method we are expecting in BinaryOperation in the enum takes two doubles and returns a double.. We don't need the return type, Swift can infer ir
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "=" : Operation.Equals
        
    ]
    
    
    func performOperation (symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant (let associativeValue):
                accumulator = associativeValue
            case .BinaryOperation (let function) :
                //Creating object of the struct and passing the arguments
                executeBinaryOperation()
                pending = pendinBinaryOperationInfo(binaryOperation: function, firstOperand: accumulator)
            case .UnaryOperation (let associativeFunction) :
                accumulator = associativeFunction(accumulator)
            case .Equals :
                executeBinaryOperation()
                
            }
        }
    }
    
    private func executeBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
            pending = nil
        }
        
    }
    
    private var pending : pendinBinaryOperationInfo?
       struct pendinBinaryOperationInfo {
        var binaryOperation : (Double,Double) -> Double
        var firstOperand : Double
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
