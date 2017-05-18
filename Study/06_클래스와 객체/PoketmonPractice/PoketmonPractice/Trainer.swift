//
//  Trainer.swift
//  PoketmonPractice
//
//  Created by joe on 2017. 5. 18..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class Trainer {
    
    let name: String
    var havePoketmon:[Poketmon]?
    var haveBadge: Int = 0
    var exp: Int = 0
    var level: Int = 1
    
    init(name:String){
        self.name = name
    }
    
    func addPoketmon(catchPoketmon monster:Poketmon){
        
        if let poketmonList:[Poketmon] = havePoketmon{
            
            var finalHaveMonserList = poketmonList
            
            finalHaveMonserList.append(monster)
            exp += 100
        }
    }
    
}
