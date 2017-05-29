//
//  ViewController.swift
//  UIView
//
//  Created by joe on 2017. 5. 22..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let newLabel = UILabel(frame: CGRect(x: 15, y: 20, width: 300, height: 20))
        newLabel.text = "예제 화면 입니다"
        self.view.addSubview(newLabel)
        
        let newLabelRed = UILabel(frame: CGRect(x: 200, y: 40, width: 300, height: 20))
        newLabelRed.text = "예쁜 레이블 입니다."
        newLabelRed.textColor = UIColor.red
        self.view.addSubview(newLabelRed)
        
        let blackSque = UIView(frame: CGRect(x: 15, y: 60, width: 250, height: 150))
        blackSque.backgroundColor = UIColor.black
        self.view.addSubview(blackSque)
        
        let whiteLabel = UILabel(frame: CGRect(x: 50, y: 130, width: 200, height: 20))
        whiteLabel.text = "View위에 레이블입니다."
        whiteLabel.textColor = UIColor.white
        blackSque.addSubview(whiteLabel)
        
        let newLabelCenter = UILabel(frame: CGRect(x: 0, y: 250, width: view.bounds.width, height: 20))
        newLabelCenter.text = "중앙에있는 레이블입니다."
        newLabelCenter.textAlignment = NSTextAlignment.center
        self.view.addSubview(newLabelCenter)

        let newLabelsize20 = UILabel(frame: CGRect(x: 0, y: 300, width: view.bounds.width, height: 20))
        newLabelsize20.text = "폰트는20"
        newLabelsize20.font = UIFont.systemFont(ofSize: 20)
        newLabelsize20.textAlignment = NSTextAlignment.center
        self.view.addSubview(newLabelsize20)
        
        let testView = UIView(frame: CGRect(x: 15, y: 400, width: 20, height: 20))
        testView.backgroundColor = UIColor.darkGray
        self.view.addSubview(testView)
        
        let testText = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        testText.text = "꺅"
        testText.font = UIFont.systemFont(ofSize: 20)
        testText.textAlignment = NSTextAlignment.center
        testText.textColor = UIColor.white
        testView.addSubview(testText)
        
        let firstImag = UIImageView(frame: CGRect(x: 15, y: 500, width: 80, height: 150))
        firstImag.image = UIImage(named: "/Users/joe/XcodePractice/VendingMachine/001.png")
        firstImag.contentMode = UIViewContentMode.scaleAspectFit //aspect가 들어가면 비율을 가지고간다
        self.view.addSubview(firstImag)
        
        let secondImg = UIImageView(frame: CGRect(x: 95, y: 500, width: 80, height: 150))
        secondImg.image = UIImage(named: "/Users/joe/XcodePractice/VendingMachine/002.png")
        secondImg.contentMode = UIViewContentMode.scaleToFill//내가 지정한 사이즈에 딱맞게
        self.view.addSubview(secondImg)
        
        let thirdImg = UIImageView(frame:CGRect(x: 175, y: 500, width: 80, height: 150))
        thirdImg.image = UIImage(named: "/Users/joe/XcodePractice/VendingMachine/003.png")
        thirdImg.contentMode = UIViewContentMode.scaleAspectFill
        //aspect가 들어가면 비율을 가지고간다, 비율에 맞게 채운다.(그럼 세로크기로 다채워짐 가로는 삐져나가고..) 
        self.view.addSubview(thirdImg)
        
        // numberoflines 쓰려면 레이블영역이 커야댐
        // view.bounds.width - 현재 뷰의 가로사이즈 가져옴
        // CG렉트에 넣는 값은 다 포인트~
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

