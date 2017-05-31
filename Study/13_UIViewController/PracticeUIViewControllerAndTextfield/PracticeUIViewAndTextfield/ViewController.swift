//
//  ViewController.swift
//  PracticeUIViewAndTextfield
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    @IBAction func unwind(fromSeconview: UIStoryboardSegue){}
    @IBAction func clickGoBtn(_ sender: UIButton) {
        
    
            //Go 버튼을 눌렀을때 유저디폴트를 저장한다//
            UserDefaults.standard.set(self.tfName.text, forKey: "Name")
            UserDefaults.standard.set(self.tfGender.text, forKey: "Gender")
            UserDefaults.standard.set(self.tfAge.text, forKey: "Age")
            //저장한 유저디폴트값을 변수로 설정해줌
            let name:String = UserDefaults.standard.string(forKey: "Name")!
            let gender:String = UserDefaults.standard.string(forKey: "Gender")!
            let age:String = UserDefaults.standard.object(forKey: "Age")! as! String
            
            
            
            //저장된거 확인
            print(name)
            print(gender)
            print(age)
    
    }
 
    @IBOutlet weak var switcher: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tfName.delegate = self
        tfName.placeholder = "Name : 이름"
        tfGender.delegate = self
        tfGender.placeholder = "Gender : 성별"
        tfAge.delegate = self
        tfAge.placeholder = "Age : 나이"
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if switcher.selectedSegmentIndex == 0 {
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       ///다음 뷰 컨트롤러를 목적지로 정해준다////
        let secondVC:SecondViewController = segue.destination as! SecondViewController
        
        secondVC.nameData = tfName.text
        secondVC.genderData = tfGender.text
        secondVC.ageData = tfGender.text
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            tfGender.becomeFirstResponder()
        }else if textField.tag == 1 {
            tfAge.becomeFirstResponder()
        }else{
            tfAge.resignFirstResponder()
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

