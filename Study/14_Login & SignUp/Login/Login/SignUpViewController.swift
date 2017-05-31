//
//  SignUpViewController.swift
//  Login
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nickNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var checkPasswordTF: UITextField!
    
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //////////////////////////////////////////////////////
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 100), animated:true)
        //        self.ㅌㅏ이틀레이블.ishidden = true 레이블글씨들이 거슬리면 숨겨줌
        //        self.타이틀레이블.alpha = 0.0 해도 없어짐
    }
    
    
    // 리턴하면 옵셋 다시 내려줌
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag < 3 {
            self.view.viewWithTag(textField.tag+1)?.becomeFirstResponder()
        }else if textField.tag == 3 {
            self.view.viewWithTag(3)?.resignFirstResponder()
        }
        return true
    }
    
    func signUpRequest() {
        
        self.view.endEditing(true)
        
        if !(emailTF.text?.isEmpty)! && !(nickNameTF.text?.isEmpty)! && !(passwordTF.text?.isEmpty)! && passwordTF.text! == checkPasswordTF.text! {
            
            UserDefaults.standard.set(emailTF.text!, forKey: "Email")
            UserDefaults.standard.set(nickNameTF.text!, forKey: "NickName")
            UserDefaults.standard.set(passwordTF.text!, forKey: "Password")
            
//            //회원가입하자마자 로그인 시킨상태로 하고싶으면
//            UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
            
            print(UserDefaults.standard.string(forKey: "Email"))
            
        } else {
            self.subTitleLable.text = "다 채워주세여"
        }
    }
    
    @IBAction func signUpBtntouched(_ sender: UIButton) {
        
        self.signUpRequest()
        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "unwindSegue" , sender: self)
        
        
    }
    
}








/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


