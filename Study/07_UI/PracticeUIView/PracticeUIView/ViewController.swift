//
//  ViewController.swift
//  PracticeUIView
//
//  Created by joe on 2017. 5. 22..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blacksquere = UIView(frame: CGRect(x: 20, y: 20, width: 10, height: 10))
        blacksquere.backgroundColor = UIColor.black
        self.view.addSubview(blacksquere)
        
        let blackSquereWhiteText = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        blackSquereWhiteText.text = "*"
        blackSquereWhiteText.font = UIFont.systemFont(ofSize: 10)
        blackSquereWhiteText.textColor = UIColor.white
        blackSquereWhiteText.textAlignment = NSTextAlignment.center
        blacksquere.addSubview(blackSquereWhiteText)
        
        let imag = UIImageView(frame: CGRect(x: 40, y: 40, width: 50, height: 90))
        imag.image = UIImage(named: "/Users/joe/XcodePractice/VendingMachine/001.png")
        imag.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(imag)
        
        
        let can2 = UIImageView(frame: CGRect(x: 50, y: 100, width: 120, height: 200))
        can2.image = UIImage(named: "/Users/joe/XcodePractice/VendingMachine/003.png")
        can2.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(can2)
        
        let thisislabel = UILabel(frame: CGRect(x: 50, y: 150, width: view.bounds.width, height: 20))
        thisislabel.text = "오늘은 넘 졸리당"
        thisislabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(thisislabel)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

