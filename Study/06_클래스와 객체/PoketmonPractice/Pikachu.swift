//
//  Pikachu.swift
//  PoketmonPractice
//
//  Created by joe on 2017. 5. 18..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation

class Pikachu:Poketmon {
    
    init(){
        super.init(name: "피카츄", type: "전기")
        skills = [["name":"전기충격" , "demage": 20] , ["name":"몸통박치기" , "demage": 20]]
    }

    
    func refreshMind(){
        
        hp += 15
        
        if hp > 100 {
            return hp = 100
        }
    }

    func evadeSameType(fromMonster monster:Poketmon) -> Bool {
        
        if monster.type == "전기" {
            return true
        }
        return false
    
    }

}
