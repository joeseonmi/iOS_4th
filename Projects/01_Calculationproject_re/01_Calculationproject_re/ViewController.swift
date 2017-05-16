//
//  ViewController.swift
//  01_Calculationproject_re
//
//  Created by joe on 2017. 5. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    ///////////////////////////////////////////////////////////////////////////
    
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    var displayNumber:String = "0"
    
    
    @IBOutlet var displynum: UILabel!
    
    @IBAction func num1(_ sender: UIButton)
    {
        //디스플레이 변경
        
        if displayNumber == "0" {
            displayNumber = "1"
        }else{
             displayNumber += "1"
        }
        
        
        if tempOperation.isEmpty
        {
            //아직 첫번째 숫자
            tempFirstNum = Int(displayNumber)!
        }else
        {
            //두번째숫자
            tempSecondNum = Int(displayNumber)!
        }
        self.displynum.text = displayNumber
    }
    
    @IBAction func num2(_ sender: UIButton)
    {
       
        if displayNumber == "0" {
            displayNumber = "2"
        }else{
            displayNumber += "2"
        }
        
        self.displynum.text = displayNumber
        
        if tempOperation.isEmpty
        {
            //아직 첫번째 숫자
            tempFirstNum = Int(displynum.text!)!
        }else
        {
            //두번째숫자
            tempSecondNum = Int(displynum.text!)!
        }
       
    }
    
    @IBAction func plus(_ sender: UIButton) {
        tempOperation = "+"
        displayNumber = "0"
        
    }
    
    
    func plus(firstNum:Int, secondNum:Int) -> Int
    {
        let result:Int = firstNum + secondNum
        return result
    }
    
    @IBAction func multip(_ sender: UIButton) {
        tempOperation = "*"
        displayNumber = "0"
    }
    
    func multip(firstNum:Int, secondNum:Int) -> Int
    {
        let result:Int = firstNum * secondNum
        return result
    }
    
    @IBAction func equal(_ sender: UIButton) {
        
        var resultValue:Int = 0
        
        switch tempOperation {
        case "+":
            resultValue = plus(firstNum: tempFirstNum, secondNum: tempSecondNum)
            
        case "*":
            resultValue = multip(firstNum: tempFirstNum, secondNum: tempSecondNum)
        default:
            resultValue = 0
        }
        
        displynum.text = "\(resultValue)"
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        
        let resultClear:Int = 0
        
        displayNumber = "0"
        tempFirstNum = 0
        tempSecondNum = 0
        
        displynum.text = "\(resultClear)"
    }
    
    
    ///////////////////////////////////////////////////////////////////////////

    @IBAction func num3(_ sender: UIButton) {
      
    }
    @IBAction func num4(_ sender: UIButton) {
        let displayingText: String = self.displynum.text!
        self.displynum.text = displayingText + "4"
    }
    //위에는 뺀거
    @IBAction func num5(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "5"
    }
    //이거는 안뺀거(5) .이랑 !이거는 무슨의미로쓰는지모르겠다
    //View메뉴들 어떤식으로 사용해야되는지 궁금
    @IBAction func num6(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "6"
    }
    @IBAction func num7(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "7"
    }
    @IBAction func num8(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "8"
    }
    @IBAction func num9(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "9"
    }
    @IBAction func num0(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "0"
    }
    @IBAction func dot(_ sender: UIButton) {
        self.displynum.text = "."
    }
   

    @IBAction func subtrac(_ sender: UIButton) {
  
    }
    @IBAction func divis(_ sender: UIButton) {
        
    }

    
    @IBAction func per(_ sender: UIButton) {
        
    }
    @IBAction func plm(_ sender: UIButton) {
        
    }
   
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

