//
//  Subject.swift
//  StudentGradeCalculateor
//
//  Created by joe on 2017. 5. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class Subject {
    
    var name:String
    var score:Int
    //밑에서 이닛으로 선언될꺼라서 옵셔널같은거 안붙임
    
    init(name:String, score:Int){
        self.name = name
        self.score = score
    }
    
}

