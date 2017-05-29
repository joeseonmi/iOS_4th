//
//  ViewController.swift
//  CollatzConjecture
//
//  Created by joe on 2017. 5. 24..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var valueArray:[Int] = []
    
    
    ///////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///////////////////////////////////////////////
    
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var resaultLabel: UILabel!
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        //어떤 양의정수가 임풋넘버
        //1. 짝수인지아닌지
        //1 짝수면 2로 나눈다
        //홀수면 3을 곱하고 1을 더한다
        //저거 한 값이 1일때 몇번 반복했는지?
        calculCollatz()
    }
    
    
    func calculCollatz(){
   
        var numberN:Int = Int(self.inputNumber.text!)!
        valueArray = []
        while numberN != 1 {
            
            if numberN % 2 == 0 {
                numberN = numberN / 2
                valueArray.append(numberN)
            }else{
                numberN = ( numberN * 3 ) + 1 //3곱하기 1
                valueArray.append(numberN)
            }
        }
        self.resaultLabel.text = "\(valueArray.count)번 반복!"
    }

    

}
