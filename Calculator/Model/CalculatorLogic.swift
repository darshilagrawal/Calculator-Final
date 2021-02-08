

import Foundation

struct CalculatorLogic{
    private var intermediateCalc:(value:Double,sign:String)?
    var number:Double?
    
    mutating func setNumber(_ n:Double){
        
        number=n
        
    }
    mutating func calculate(symbol:String) -> Double?{
        if let n=number{
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalc(n2: n)
            default:
                intermediateCalc = (value: n, sign: symbol)
            }
        }
        return nil
    }
    func performTwoNumberCalc(n2:Double) -> Double?{
        if let n1=intermediateCalc?.value,
           let symbol=intermediateCalc?.sign{
            
            switch symbol {
            case "+":
                return n1 + n2
            case "-":
                return n1-n2
            case "×":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("The Operation Symbol Does not match any of the symbol")
            }
        }
        return nil
    }
}


