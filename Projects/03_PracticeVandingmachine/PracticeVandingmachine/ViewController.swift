//
//  ViewController.swift
//  PracticeVandingmachine
//
//  Created by joe on 2017. 5. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var drinkArray:[Drink] = [Drink(name : "핫식스", cost : 800),Drink(name : "코카콜라", cost : 1200),Drink(name : "헛개수", cost : 1500)]
    
    var coins:[Cost] = [Cost(name : "100원", costValue: 100),Cost(name : "500원", costValue: 500),Cost(name : "1000원", costValue: 1000)]
    
    
    ////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var returnChangesText: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func clickDrinks(_ sender: UIButton) {
        //이 버튼을 눌렀을때 누른 음료의 코스트만큼 잔액레이블의 숫자가 빠진다.
        //음료의 코스트를 어떻게 불러오는지, 잔액레이블에서 어떻게 계산될껀지 생각해보자
        //버튼을 누른다 -> 잔액이 코스트보다 많은지 확인한다 -> 잔액에서 코스트만큼 차감된다. 이런순서일듯
        //drinkArray를 만들었고, 거기에 코스트가 있으니까 여깄는걸 불러오고싶다.
        //for in 문으로 불러올 수 있다.(collection type값은 for in으로 불러올수있댓어
        //index는 어레이안에서의 순서-value는 어레이안에이는 엘리먼트고 내가 만든 클래스 안에서는 Drink(name:String, cost: Int) 형태얌
        
        for (index,value) in drinkArray.enumerated(){
            //이제 어레이안의 값을 불러올수있써 -> 잔액이 코스트보다 많은지 확인해야되는데 index부터 정리해줘야지
            if index == sender.tag { //index랑 sendertag가 같으면 if문이 돈다
                if Int(self.returnChangesText.text!)! >= value.cost && value.count > 0 { //Drink(name:String, cost: Int) 이거시 벨륜데 여기의 코스트보다 크거나 같으면돈다)//
                    switch index {
                    case 0 :
                        self.returnChangesText.text = String(Int(self.returnChangesText.text!)! - value.cost)
                        value.count -= 1
                    case 1 :
                        self.returnChangesText.text = String(Int(self.returnChangesText.text!)! - value.cost)
                        value.count -= 1
                    case 2 :
                        self.returnChangesText.text = String(Int(self.returnChangesText.text!)! - value.cost)
                        value.count -= 1
                    default: print("예상치 못한 값")
                    }
                    self.displayLabel.text = "\(value.name) 받으세요."
                 
                    if value.count == 0 { //밸류의 카운트가 0이면 각 레이블에 품절표시를 해준다.
                  
                        switch index {
                        case 0 :
                            self.soldoutLabel.text = "품절"
                        case 1 :
                            self.soldoutCoke.text = "품절"
                        case 2 :
                            self.soldouthutkae.text = "품절"
                    
                        default: print("예상치 못한 값")
                            //코드리뷰: 걍 비워두지말고 이렇게 써놓으면 예상치 못한값이 들어왔을때 알수있음
                
                        }
                    }
                }

                else if value.count == 0 {
                    self.displayLabel.text = "품절상품 입니다."
                }

                else {
                    self.displayLabel.text = "잔액이 부족합니다."
                }
            }
        }

    }
    
    
    @IBAction func clickAddDrink(_ sender: UIButton) {
        //이버튼을 누르면 모든 재고가 5로 채워진다
        //drinkArray의 엘리먼트의 카운트속성들이 5가된다
        //그리고 품절상태였던 표시등이 판매중으로 바뀐다
        //어레이값부르려면 머다? for in이다~
        
        
        for (index, value) in drinkArray.enumerated(){
            if index < 3 {
                value.count = 5
            }
        }
        
        self.soldoutLabel.text = "판매중"
        self.soldoutCoke.text = "판매중"
        self.soldouthutkae.text = "판매중"
        
    }
    
    @IBAction func clickCoins(_ sender: UIButton) {
        //돈을 클릭했을때 잔액에 누른 돈 만큼 더해졌으면 좋겠다
        //돈을 누른다 -> 잔액에 플러스된다
        //돈도 클래스있고 어레이로 만들어서 Drink랑 비슷하게 만들꺼다
        //어레이에있는거 부를려면 for in문이다
        
        for (index, value) in coins.enumerated(){ //이제 어레이 부를수있섭
            //값 불러서 잔액레이블에 더해
            //어뜨케 부르냐면 스위치 근데 이것도 인덱스가 먼지 정해줘야될듯
            if index == sender.tag {
                
                switch index {
                case 0 :
                    self.returnChangesText.text = String(Int(self.returnChangesText.text!)! + value.costValue)
                case 1 :
                    self.returnChangesText.text = String(Int(self.returnChangesText.text!)! + value.costValue)
                case 2 :
                    self.returnChangesText.text = String(Int(self.returnChangesText.text!)! + value.costValue)
                default : print("예상치 못한 값")
                }
                
            }
            
        }
        
    }
    
    @IBOutlet weak var soldoutLabel: UILabel!
    @IBOutlet weak var soldoutCoke: UILabel!
    @IBOutlet weak var soldouthutkae: UILabel!
    
    @IBAction func clickReturnMoney(_ sender: UIButton) {
        
        //잔돈을 어떻게 거슬러줄건지
        //천원짜리, 오백원짜리,백원짜리 몇장으로 줄건지 
        
        let money1000:Int = Int(self.returnChangesText.text!)!/1000
        let money500:Int = (Int(self.returnChangesText.text!)!%1000)/500
        let money100:Int = ((Int(self.returnChangesText.text!)!%1000)%500)/100
        
        self.displayLabel.text = "거스름돈 천 원 \(money1000)장, 오백 원 \(money500)개, 백 원 \(money100)개"
        self.returnChangesText.text = "0"
        
    }
    
    
    
    
    
    
    
}

