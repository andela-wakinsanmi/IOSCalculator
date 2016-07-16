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
        "×" : Operation.BinaryOperation( {(op1 , op2) in return op1 * op2 }),
        //Now we are going to use type inference to look beter
        //Swift knows, it accepts a double .. so we can get rid of the Double declaration
        //we can also remove the return type -> Double too, Swift knows that
        
        
        "−" : Operation.BinaryOperation(subtract),
        "÷" : Operation.BinaryOperation(divide),
        "+" : Operation.BinaryOperation(add),
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
