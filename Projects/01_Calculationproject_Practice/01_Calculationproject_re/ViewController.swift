//
//  ViewController.swift
//  01_Calculationproject_re
//
//  Created by joe on 2017. 5. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
////////////////// Display Label ///////////////////
    
    @IBOutlet weak var displayLabel: UILabel!
    
////////////////// Nunber button ///////////////////
    
    
    @IBAction func thouchUpNum0(_ sender: UIButton) {
        
        if displayNumber == "0"
        {
            displayNumber = "0"
        }else{
            displayNumber += "0"
        }
        
        if tempOperation.isEmpty {
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    
    
    @IBAction func thouchUpNum1(_ sender: UIButton) {
        
        if displayNumber == "0"{
            displayNumber = "1"
        }else{
            displayNumber += "1"
        }
        
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    
    @IBAction func thouchUpNum2(_ sender: UIButton) {
        
        if displayNumber == "0" {
            displayNumber = "2"
        }else{
            displayNumber += "2"
        }
        
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum3(_ sender: UIButton) {
        
        if displayNumber == "0"{
            displayNumber = "3"
        }else{
            displayNumber += "3"
        }
        
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum4(_ sender: UIButton) {
        if displayNumber == "0" {
            displayNumber = "4"
        }else{
            displayNumber += "4"
        }
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
            
    }
    @IBAction func thouchUpNum5(_ sender: UIButton) {
        
        if displayNumber == "0" {
            displayNumber = "5"
        }else{
            displayNumber += "5"
        }
        
        if tempOperation.isEmpty {
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum6(_ sender: UIButton) {
        if displayNumber == "0" {
            displayNumber = "6"
        }else{
            displayNumber += "6"
        }
        
        if tempOperation.isEmpty {
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum7(_ sender: UIButton) {
        if displayNumber == "0" {
            displayNumber = "7"
        }else{
            displayNumber += "7"
        }
        
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum8(_ sender: UIButton) {
        if displayNumber == "0"{
            displayNumber = "8"
        }else{
            displayNumber += "8"
        }
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    @IBAction func thouchUpNum9(_ sender: UIButton) {
        if displayNumber == "0" {
            displayNumber = "9"
        }else{
            displayNumber += "9"
        }
        if tempOperation.isEmpty{
            tempFirstNumber = Int(displayNumber)!
        }else{
            tempSecondNumber = Int(displayNumber)!
        }
        self.displayLabel.text = displayNumber
    }
    
    ////////////////// Operation func ///////////////////
    
    var tempFirstNumber:Int = 0
    var tempSecondNumber:Int = 0
    var tempOperation:String = ""
    var displayNumber:String = "0"
    
    func plus(firstNum:Int, secondNum:Int) -> Int {
        return firstNum + secondNum
    }
    
    func subtraction(firstNum:Int, secondNum:Int) -> Int {
        return firstNum - secondNum
    }
    
    func multiple(firstNum:Int, secondNum:Int) -> Int {
        return firstNum * secondNum
    }
    
    func divde(firstNum:Int, secondNum:Int) -> Int {
        return firstNum / secondNum
    }
    
    
    ////////////////// Operation button ///////////////////
    
    @IBAction func plus(_ sender: UIButton) {
        tempOperation = "+"
        displayNumber = "0"
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        tempOperation = "-"
        displayNumber = "0"
    }
    
    @IBAction func multiple(_ sender: UIButton) {
        tempOperation = "*"
        displayNumber = "0"
    }
   
    
    @IBAction func divde(_ sender: UIButton) {
        tempOperation = "/"
        displayNumber = "0"
    }
    
    @IBAction func equl(_ sender: UIButton)
    {
        var resultValue:Int = 0
        
        switch tempOperation
        {
        case "+":
            resultValue = plus(firstNum: tempFirstNumber, secondNum: tempSecondNumber)
      
        case "*":
            resultValue = multiple(firstNum: tempFirstNumber, secondNum: tempSecondNumber)
            
        case "-":
            resultValue = subtraction(firstNum: tempFirstNumber, secondNum: tempSecondNumber)
  
        case "/":
            resultValue = divde(firstNum: tempFirstNumber, secondNum: tempSecondNumber)
        
        default:
            resultValue = 0
        
        }
        self.displayLabel.text =  "\(resultValue)"
        
        tempFirstNumber = 0
        tempSecondNumber = 0
        tempOperation = ""
        displayNumber = "0"
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        
        let resultClear:Int = 0
        
        tempFirstNumber = 0
        tempSecondNumber = 0
        displayNumber = "0"

        self.displayLabel.text = "\(resultClear)"
    }
    
//////////////////////////////////////////////////////

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

