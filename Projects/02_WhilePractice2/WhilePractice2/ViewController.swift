//
//  ViewController.swift
//  WhilePractice2
//
//  Created by joe on 2017. 5. 16..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
////////////while로 구구단 만들기////////////////////////////
        
        func playGugudan(dan:Int)
        {
            var gob:Int = 1
            while gob <= 9
            {
                print("\(dan) * \(gob) = \(dan * gob)")
                gob += 1
            }
        }

        
        playGugudan(dan: 3)
        
///////////////////////////////////////////////////////
        
////////////for in 구구단 만들기////////////////////////////
        
        func platGugudanForin(dan:Int)
        {
            var gob:Int = 1
            for gob in 1...9
            {
                print("\(dan) * \(gob) = \(dan * gob)")
            }
        }
        
        platGugudanForin(dan: 6)
        
///////////////////////////////////////////////////////
        
////////////중복 가능한 로또 만들기////////////////////////////
        
        func makeLottoNumber() -> [Int]
        {
            var lottoNumbers:[Int] = []
            
            while lottoNumbers.count < 6 {
                let randomNum:UInt32 = arc4random_uniform(46)//->번호를 랜덤으로뽑아
                if randomNum != 0 {
                    lottoNumbers.append(Int(randomNum))}//->lottoNumber배열에 넣어주세여
            }
            
            return lottoNumbers
        
        }
        
        print(makeLottoNumber())
        
///////////////////////////////////////////////////////
        
////////////중복 불가능한 로또 만들기////////////////////////////
        
        func makeLottoNumberNotRepeat() -> [Int]
        {
            var notRepeatNumber:[Int] = []
            
            while notRepeatNumber.count < 6
            {
               let randomNum:UInt32 = arc4random_uniform(46)
                
                if randomNum != 0 && !notRepeatNumber.contains(Int(randomNum))
                {
                    notRepeatNumber.append(Int(randomNum))
                }
            }
            
             return notRepeatNumber
        }
        
        print(makeLottoNumberNotRepeat())
        
///////////////////////////////////////////////////////
        
////////////약수 뽑기////////////////////////////
        
        func pickMeasure(valueNumber:Int) -> [Int]
        {
            var measure:[Int] = []
            
            for index in 1...valueNumber
            {
                if valueNumber % index == 0
                {
                    measure.append(index)
                }
            }
            return measure
        }
        
        print(pickMeasure(valueNumber: 12))
        
///////////////////////////////////////////////////////
        
////////////소수인지 아닌지////////////////////////////
        
        func isDecimal(number:Int) -> Bool
        {
            var measure:[Int] = []
            
            for index in 1...number
            {
                if number % index == 0 {
                    measure.append(index)
                }
            }
            
            if measure.count <= 2
            {
                print("소수")
                return true
            }
                
            print("소수가아니다")
            return false
        }
        
        
        isDecimal(number: 9)

///////////////////////////////////////////////////////
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

