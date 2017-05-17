//
//  ViewController.swift
//  StudentGradeCalculateor
//
//  Created by joe on 2017. 5. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let s1:Student = Student(name: "joe")
        s1.add(subjectName: "수학", score: 90)
        s1.add(subjectName: "국어", score: 80)
        s1.add(subjectName: "영어", score: 79)
        s1.add(subjectName: "과학", score: 95)
        
        let manager:ScoreManager = ScoreManager()
        let s1Average = manager.average(forStudent: s1)
        
        
        print(s1Average)
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

