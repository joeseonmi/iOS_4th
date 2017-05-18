//
//  FightPoketmon.swift
//  PoketmonPractice
//
//  Created by joe on 2017. 5. 18..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class FightPoketmon {
    
    init(){
    }
    
    
    func vsPoketmon(firstMonster p1monster:Poketmon, seccondMonster p2monster:Poketmon){
        
        let firstmonster:Poketmon = p1monster
        let secondmonster:Poketmon = p2monster
        
        if firstmonster.hp > 0 && secondmonster.hp > 0 {
            while firstmonster.hp <= 0 || secondmonster.hp <= 0 {
                
                print("\(firstmonster.attack(targetMonster:  secondmonster, useSkill: 1))")
        
                print("\(secondmonster.attack(targetMonster: firstmonster, useSkill: 0))")
            
            }
            if firstmonster.hp > secondmonster.hp {
                print("\(firstmonster) 승리!")
            } else {
                print("\(secondmonster) 승리!")
            }
        }
        print("전투가 끝났습니다")
    
    }
    
}
