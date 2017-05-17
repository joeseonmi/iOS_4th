//
//  Students.swift
//  StudentGradeCalculateor
//
//  Created by joe on 2017. 5. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class Student {
    
    var name:String
    var subjects:[Subject]?
    var averageScore:Double?
    
    init(name:String) {
        
        self.name = name
    }
    

    func add(subjectName:String, score:Int)
    {
        if subjects == nil {
            subjects = []
        }
        let sj:Subject = Subject(name: subjectName, score: score)
            subjects?.append(sj)
    }


}
