//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label into a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var calculator = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text?.append(contentsOf: numValue)
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(contentsOf: numValue)
            }
        }
    }
    
}

