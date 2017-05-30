//
//  ViewController.swift
//  Storyboard
//
//  Created by joe on 2017. 5. 25..
//  Copyright © 2017년 joe. All rights reserved.
//



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var thirdTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstTF.placeholder = "고정텍스트"
        firstTF.delegate = self
        firstTF.tag = 1
        secondTF.delegate = self
        secondTF.tag = 2
        thirdTF.delegate = self
        thirdTF.tag = 3
        
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.characters.count)! >= 10 && range.length == 0){
            //레인지의 길이가 0일때 캐릭터들은 바뀔수있어야하고 글자수가 10보다 크면 정지
            print(range)
                return false
        }
            return true
    }
    //로케이션은 커서의 위치 / 로케이션이 11일때 멈추면 됨 입력할때는 로케이션이 바뀌고 렝스는 안바뀜
    //
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("리턴키보드눌림")
        if textField.tag == 1 {
            secondTF.becomeFirstResponder()
        }else if textField.tag == 2 {
            
            thirdTF.becomeFirstResponder()
        }else{
         textField.resignFirstResponder()
        }
        return true
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    


}

}
