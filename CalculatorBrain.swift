//
//  CalculatorBrain.swift
//  IOSCalculator
//
//  Created by spykins on 14/07/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import Foundation

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
        
    ]
    
    
    func performOperation (symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant (let associativeValue):
                accumulator = associativeValue
            case .BinaryOperation (let function) :
                //Creating object of the struct and passing the arguments
                pending = pendinBinaryOperationInfo(binaryOperation: function, firstOperand: accumulator)
            case .UnaryOperation (let associativeFunction) :
                accumulator = associativeFunction(accumulator)
            case .Equals :
                if pending != nil {
                    accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
                    pending = nil
                }
            }
        }
    }
    
    private var pending : pendinBinaryOperationInfo?
    /*
        This is an optional becaue the PendingBinartyOperation is only there when we have a pendin operation.. If we have not tap *, / + , We want the pending var to be nil at that point
    */
    
    /*
     Struct is like class, It can have doubles, stored vals and computed vals
     No inheritance .. The big difference is that, Struct like enum are passed by value while classes are passed by referencne
     An array in swift is a struct, a double is a struct, int and String are all struct..
     
     So if we pass an array to another method and we add something to the array, it will be added in the callers Array... The caller will have that Array without the new thing added
     */
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
