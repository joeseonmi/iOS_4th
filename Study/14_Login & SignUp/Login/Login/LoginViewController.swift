//
//  LoginViewController.swift
//  Login
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    @IBOutlet weak var scrollview: UIScrollView!
  
    @IBAction func clickedLogin(_ sender: UIButton) {
        
        loginRequest()
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loginRequest(){
        
        self.view.endEditing(true)
        
        if !(self.emailTextF.text?.isEmpty)! && !(self.passwordTextF.text?.isEmpty)! {
            
            if self.emailTextF.text! == UserDefaults.standard.string(forKey: Authentification.email) &&
                //이거 추상화해준거임
                self.passwordTextF.text! == UserDefaults.standard.string(forKey: Authentification.password){
                print("로그인성공")
                
                UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                
                self.dismiss(animated: true, completion: nil)
            } else {
                print("로그인실패")
            }
            
        }
        
        
    }
    
    //MARK: - TextFieldDelegate
    
    // 텍스트필드에 수정 시작하면 키보드높이만큼 올려줌
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollview.setContentOffset(CGPoint(x:0.0, y:100.0), animated: true)
    }
    // 리턴키 누르면 텍스트필드 옮겨줌
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.view.viewWithTag(1)?.becomeFirstResponder()
        }else if textField.tag == 1{
            self.view.viewWithTag(1)?.resignFirstResponder()
        }
        return true
    }
    // 리턴하면 옵셋 다시 내려줌
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollview.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
