//
//  ViewController.swift
//  HanoiTop
//
//  Created by joe on 2017. 5. 25..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hanoi(n: 3, from: "A기둥", to: "B기둥", by:"C기둥")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hanoi(n:Int , from:String, to:String ,by:String){
        
       
        
        if n == 1{
            print("\(n)번째 쟁반이 \(from)에서 \(to)로 이동")
        }else{
            
            hanoi(n: n - 1, from: from, to: by, by: to)
            print("\(n)번째 쟁반이 \(from)에서 \(to)로 이동")
            hanoi(n: n - 1, from: by, to: to, by: from)
        
        }
        
    }
    
    
    ///////////////////////////////////////////
 
