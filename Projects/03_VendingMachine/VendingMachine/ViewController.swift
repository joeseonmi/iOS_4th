//
//  ViewController.swift
//  VendingMachine
//
//  Created by joe on 2017. 5. 19..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var drinkArray:[Drink] = [Drink(name:"핫식스", cost: 800), Drink(name:"코카콜라", cost:1000), Drink(name:"헛개수", cost:1500)]
    
    let coinArray:[Coin] = [Coin(name:"100원", value:100), Coin(name:"500원", value:500), Coin(name:"1000원", value:1000)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickDrink(_ sender: UIButton) {
        var flagSoldout:Bool = true
        for (index, value) in drinkArray.enumerated(){
            if Int(self.inputChanges.text!)! >= value.cost {
                if index == sender.tag{
                    
                    self.labelMassage.text = "\(value.name) 받으세요"
                    self.inputChanges.text = String(Int(self.inputChanges.text!)! - value.cost)
                    
                    switch value.name {
                    case "핫식스":
                        self.hotSixStock.text = String(Int(self.hotSixStock.text!)! - 1)
                    case "코카콜라":
                        self.cokeStock.text = String(Int(self.cokeStock.text!)! - 1)
                    case "헛개수":
                        self.hutkaeStock.text = String(Int(self.hutkaeStock.text!)! - 1)
                    default: ""
                    }
                    drinkArray.remove(at: index)
                    flagSoldout = false
                    break
                }
            } else {
                flagSoldout = false
                self.labelMassage.text = "잔액이 부족합니다."
            }

            //        for drink:Drink in drinkArray{
            //
            //            if Int(self.inputChanges.text!)! >= drink.cost {
            //
            //                if drink.name == sender.currentTitle {
            //
            //                    self.labelMassage.text = "\(drink.name) 받으세요"
            //                    self.inputChanges.text = String(Int(self.inputChanges.text!)! - drink.cost)
            //
            //
            //
            //                }
        }
        if flagSoldout {
            self.labelMassage.text = "재고가 없습니다."
        }
        
    }
    
    @IBAction func costCoin(_ sender: UIButton) {
        
        for coins:Coin in coinArray {
            
            if coins.name == sender.currentTitle {
                
                self.inputChanges.text = String(Int(self.inputChanges.text!)! + coins.value)
                
            }
            
        }
        
    }
    //    @IBAction func clickDrink1(_ sender: UIButton) {
    //
    //        let hotSix:Drink = Drink(name:"핫식스", cost:800)
    //
    //        self.labelMassage.text = "\(hotSix.name)이 나왔습니다"
    //
    //        self.inputChanges.text = String(Int(self.inputChanges.text!)! - hotSix.cost)
    //
    //    }
    //
    //
    //    @IBAction func clickDrink2(_ sender: UIButton) {
    //
    //        let cola:Drink = Drink(name:"코카콜라", cost:1000)
    //
    //        self.inputChanges.text = String(Int(self.inputChanges.text!)! - cola.cost)
    //    }
    //
    //    @IBAction func clickDrink3(_ sender: UIButton) {
    //
    //        let hutkaesoo:Drink = Drink(name: "헛개수", cost: 1500)
    //
    //        self.inputChanges.text = String(Int(self.inputChanges.text!)! - hutkaesoo.cost)
    //
    //    }
    
    @IBOutlet weak var inputMoney: UITextField!
    @IBOutlet weak var inputChanges: UITextField!
    @IBOutlet weak var labelMassage: UILabel!
    
    @IBOutlet weak var hotSixStock: UILabel!
    
    @IBOutlet weak var cokeStock: UILabel!
    
    @IBOutlet weak var hutkaeStock: UILabel!
    
    @IBAction func addDrink(_ sender: UIButton) {
        
        switch sender.tag {
        case 0 :
            drinkArray.append(Drink(name: "핫식스", cost: 800))
            self.hotSixStock.text = String(Int(self.hotSixStock.text!)!+1)
            
        case 1 :
            drinkArray.append(Drink(name: "코카콜라", cost: 1000))
            self.cokeStock.text = String(Int(self.cokeStock.text!)!+1)
            
        case 2 :
            drinkArray.append(Drink(name: "헛개수", cost: 1500))
            self.hutkaeStock.text = String(Int(self.hutkaeStock.text!)!+1)
            
        default : ""
        }
        
    }
    
    
    @IBAction func insertCoin(_ sender: UIButton) {
        
        self.inputChanges.text = self.inputMoney.text
        self.inputMoney.text = "0"
        
    }
    
    @IBAction func returnMoney(_ sender: UIButton) {
        
        
        let totalChange:Int = Int(self.inputChanges.text!)!
        var howmany1000:Int = 0
        var howmany500:Int = 0
        var howmany100:Int = 0
        
        
        howmany1000 = (totalChange / 1000)
        howmany500 = (totalChange%1000) / 500
        howmany100 = (totalChange%1000) % 500
        
        
        self.labelMassage.text = "천 원 \(howmany1000)장, 오백 원 \(howmany500)개, 백 원 \(howmany100)개 받으세요!"
        
    }
    
}

