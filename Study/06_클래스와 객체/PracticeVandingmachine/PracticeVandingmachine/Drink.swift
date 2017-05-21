//
//  Drink.swift
//  PracticeVandingmachine
//
//  Created by joe on 2017. 5. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class Drink {
    
    let name : String
    let cost : Int
    var count : Int = 5
    
    init(name : String, cost : Int){
        
        self.name = name
        self.cost = cost
        
    }
    
}
