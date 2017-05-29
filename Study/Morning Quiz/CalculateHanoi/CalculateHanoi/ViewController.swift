//
//  ViewController.swift
//  CalculateHanoi
//
//  Created by joe on 2017. 5. 25..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateHanoi(n: 3, fromPole: "A", middlePole: "B", toPole: "C")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     하노이 타워
     n 보다 하나 작은 원판은 원래 목적지가 아닌 다른 목적지로 보낸다.   n-1 = A->B
     가장 큰 디스크는 출발지로부터 목적지로 간다                    n = A -> C
                                                         n-1 = B->C
     
     
     크기가 제일 큰 원판을 옮겨주려면 그 위의 원판들을 다 B로 옮겨야됨
     원판이 몇갠지 모르니까 n-1개의 원판에도 n-1을.....재귀...
     제일 큰 원판은 한번만 움직임
     그리고 경유폴로 갔던 n-1원판들이 다시 경유폴에서 목적폴로 이동
     재귀!!!!!!!!!!!!!!!!!!!!!!!!
     
     
     
     */
    
    func calculateHanoi(n:Int, fromPole:String, middlePole:String, toPole:String){

        
        if n == 1{
            print("\(n)번째 쟁반을 \(fromPole)에서 \(toPole)로 이동")
            
        }else{
            calculateHanoi(n: n-1, fromPole: fromPole, middlePole: toPole, toPole: middlePole)
            //print("\(n-1)번째 쟁반을 \(fromPole)에서 \(middlePole)로 이동")
            print("\(n)번째 쟁반을 \(fromPole)에서 \(toPole)로 이동")
            //print("\(n)번째 쟁반을 \(fromPole)에서 \(toPole)로 이동")
            calculateHanoi(n: n-1, fromPole: middlePole, middlePole: fromPole , toPole: toPole)
        }
    }

}

