//
//  Poketmon.swift
//  PoketmonPractice
//
//  Created by joe on 2017. 5. 18..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class Poketmon {
    
    let name:String
    var hp:Int = 100
    let type:String
    var skills:[[String:Any]]? //[["name":"스킬1네임","demage":20],["name":"스킬2네임", "damage":100]] 딕셔너리표기하는방법 다시보기 ㅠㅠ
    
    init(name:String, type:String) {
        self.name = name
        self.type = type
    }
    
    
    
    
    func attack(targetMonster monster: Poketmon, useSkill skillNumber: Int){
        
        if let skillList = skills {
            
            if monster.hp > 0 {
                
                let skill:[String:Any] = skillList[skillNumber]
                let skillName:String = skill["name"] as! String
                print("\(self.name)(이)가 \(monster.name)에게 \(skillName)사용!")
                let skillDemage:Int = skill["demage"] as! Int
                
                monster.hp -= skillDemage
                
                print("\(monster.name)의 HP가 \(monster.hp)남았다!")
                
                if monster.hp == 0 {
                    print("\(monster.name)(이)가 죽었습니다.")
                }
                
            } else {
                print("\(monster.name)(이)가 죽었습니다.")
            }
            
        }
    }
}
