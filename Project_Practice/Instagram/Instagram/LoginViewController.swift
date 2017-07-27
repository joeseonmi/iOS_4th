//
//  loginViewController.swift
//  Instagram
//
//  Created by joe on 2017. 7. 24..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    let bgImg:UIImageView = {
        let bgImg = UIImageView()
        bgImg.image = #imageLiteral(resourceName: "bg")
        bgImg.contentMode = .scaleAspectFit
        return bgImg
    }()
    
    let idTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.rgbColor(255, 255, 255)
        tf.placeholder = "  ID"
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        tf.font = UIFont(name: (tf.font?.fontName)!, size: 12)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    
    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.rgbColor(255, 255, 255)
        tf.placeholder = "  PASSWORD"
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        tf.font = UIFont(name: (tf.font?.fontName)!, size: 12)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
        
    }()
    
    let loginButton:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitle("login", for: .normal)
        btn.backgroundColor = UIColor.rgbColor(31, 207, 255)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(loginBtn), for: .touchUpInside)
        return btn
    }()
    
    let signupButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("signup", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(31, 207, 255), for: .normal)
        btn.titleLabel?.font = UIFont.init(name: (btn.titleLabel?.font.fontName)!, size: 14)
        btn.addTarget(self, action: #selector(handleSignupBtn), for: .touchUpInside)
        return btn
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return stackView
    }()
    
    
    let logoImageView:UIImageView = {
        let logoImgeView = UIImageView()
        logoImgeView.image = #imageLiteral(resourceName: "logo")
        return logoImgeView
    }()
    
    
    func loginBtn(){
        
        Auth.auth().signIn(withEmail: idTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error {
                print("error")
                return
            }
            print("userID", user?.uid)
            self.dismiss(animated: true, completion: nil)
            //셀프의 탭바컨트롤러에다가 show를 시킨다
        }
        
    }
    
    func handleSignupBtn(){
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    func handleTextInputChange(){
        let isFormValid = idTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        if isFormValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgbColor(31, 207, 255)
        }else{
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.rgbColor(100, 100, 100)
        }
    }
    
    
    fileprivate func setUPSubviewsLayout(){
        
        bgImg.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: -60, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: view.frame.width, height: view.frame.width*9/16, centerX: view.centerXAnchor, centerY: nil)
        bgImg.clipsToBounds = true
        
        
        logoImageView.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 80, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: view.frame.width/5*3, height: view.frame.width/5*3/16*9, centerX: view.centerXAnchor, centerY: nil)
        logoImageView.contentMode = .scaleAspectFit
        
        stackView.anchor(top: logoImageView.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: view.frame.width*3/4, height: 150, centerX: view.centerXAnchor, centerY: nil)
        
    }
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(bgImg)
        view.addSubview(logoImageView)
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        stackView.addArrangedSubviews([idTextField,passwordTextField,loginButton,signupButton])
        view.addSubview(stackView)
        setUPSubviewsLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
