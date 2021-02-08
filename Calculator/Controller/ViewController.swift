
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber:Bool=true
   private var calculator=CalculatorLogic()
    private var displayValue:Double{
        get{
            guard let calcValue=Double(displayLabel.text!)else{
                fatalError("Error converting String to double")
            }
            return calcValue
        }
        set{
            displayLabel.text=String(format:"%.0f",newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber=true
        calculator.setNumber(displayValue)
        if let calcMethod=sender.currentTitle{
           
            
            if let finalValue = calculator.calculate(symbol: calcMethod){
            displayValue=finalValue
        }
        //What should happen when a non-number button is pressed
        
    }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue=sender.currentTitle{
            
            if  isFinishedTypingNumber{
                
                displayLabel.text=numValue
                isFinishedTypingNumber=false
            }else{
                
                if numValue=="."{
                    
                    if floor(displayValue) != displayValue{
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
        
        //What should happen when a number is entered into the keypad
        
    }
    
}

