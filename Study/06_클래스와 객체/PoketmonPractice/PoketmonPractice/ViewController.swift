//
//  ViewController.swift
//  PoketmonPractice
//
//  Created by joe on 2017. 5. 18..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fightsystem:FightPoketmon = FightPoketmon()
        let pika:Pikachu = Pikachu()
        let kkobook:Kkobooki = Kkobooki()
    
    fightsystem.vsPoketmon(firstMonster: pika, seccondMonster: kkobook)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

