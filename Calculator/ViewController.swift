//
//  ViewController.swift
//  Calculator
//
//  Created by Stainley A Lebron R on 10/7/22.
//

import UIKit

class ViewController: UIViewController {

    var firstNumberText = ""
    var secondNumberText = ""
    var isFirstNumber: Bool = true
    var mathOperation: Operation = Operation.ADDITION
    
    var currentNumber: String = ""
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func clear(_ sender: UIButton) {
        result.text = ""
        firstNumberText = ""
        secondNumberText = ""
    }
    
    @IBAction func buttons(_ sender: UIButton) {
                       
        if let textTyped = sender.titleLabel?.text {
            switch textTyped {
                case "+", "-", "/", "*":
                
                    if let currentText = result.text {
                        if textTyped == "+" {
                            mathOperation = Operation.ADDITION
                            result.text = "\(currentText)\(mathOperation.rawValue)"
                        } else if textTyped == "-" {
                            mathOperation = Operation.SUBSTRACTION
                            result.text = "\(currentText)\(mathOperation.rawValue)"
                        } else if textTyped == "/" {
                            mathOperation = Operation.DIVISION
                            result.text = "\(currentText)\(mathOperation.rawValue)"
                        } else if textTyped == "*" {
                            mathOperation = Operation.MULTIPLICATION
                            result.text = "\(currentText)\(mathOperation.rawValue)"
                        }
                    }
                    isFirstNumber = false
                    break
                case "=":
                    isFirstNumber = true
                    let resultOperation = calculate()
                
                    if resultOperation.rounded(.up) == resultOperation.rounded(.down) {
                        result.text = String(format: "%.f", resultOperation)
                    } else {
                        result.text = "\(resultOperation)"
                    }
                    firstNumberText = "\(resultOperation)"
                    break
                default:
                    if isFirstNumber {
                        firstNumberText = "\(firstNumberText)\(textTyped)"
                    } else {
                        secondNumberText = "\(secondNumberText)\(textTyped)"
                    }
                    result.text?.append("\(textTyped)")
            }
        }
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        
        firstNumberText = ""
        secondNumberText = ""
        
        switch mathOperation {
            case .ADDITION :
                return firstNumber + secondNumber
            case .SUBSTRACTION:
                return firstNumber - secondNumber
            case .DIVISION:
                return firstNumber / secondNumber
            case .MULTIPLICATION:
                return firstNumber * secondNumber
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.text = ""
        
    }


}

