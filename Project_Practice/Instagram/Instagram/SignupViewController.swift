//
//  SignupViewController.swift
//  Instagram
//
//  Created by joe on 2017. 7. 24..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    /*******************************************/
    //                Property                 //
    /*******************************************/
    
    let bgImg:UIImageView = {
        let bgImg = UIImageView()
        bgImg.image = #imageLiteral(resourceName: "bg")
        bgImg.contentMode = .scaleAspectFit
        return bgImg
    }()
    
    let photoBtn:UIButton = {
        let btn = UIButton()
        //        btn.setTitle("사진", for: .normal)
        //        btn.setTitleColor(UIColor.rgbColor(31, 207, 255), for: .normal)
        btn.addTarget(self, action: #selector(photoActionHandel), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "Rectangle 1"), for: .normal)
        btn.contentMode = .scaleAspectFill
        //이걸 적용해야 오토레이아웃이 적용된다, 오토리사이즈마스크는 프레임베이스에서 쓰는데 화면크기가 바뀔때 (가로세로모드등), 자동으로 바꿔줌
        //        btn.backgroundColor = .red
        return btn
    }()
    
    let signupBtn:UIButton = {
        let btn = UIButton(type:.system)
        btn.layer.cornerRadius = 10
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.rgbColor(100, 100, 100)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(signupBtnHandler), for: .touchUpInside)
        return btn
        
    }()
    
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.rgbColor(255, 255, 255)
        tf.placeholder = "  input Email"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        tf.font = UIFont(name: (tf.font?.fontName)!, size: 12)
        tf.layer.cornerRadius = 10
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    
    
    let userNameTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.rgbColor(255, 255, 255)
        tf.placeholder = "  input UserName"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        tf.font = UIFont(name: (tf.font?.fontName)!, size: 12)
        tf.layer.cornerRadius = 10
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let passWordTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.rgbColor(255, 255, 255)
        tf.placeholder = "  input Password"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        tf.font = UIFont(name: (tf.font?.fontName)!, size: 12)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.spacing = 10
        return stackView
    }()
    
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgImg)
        self.view.backgroundColor = .white
        view.addSubview(photoBtn)
        stackView.addArrangedSubviews([emailTextField, userNameTextField, passWordTextField, signupBtn])
        view.addSubview(stackView)
        setUpSubViewsLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    /*******************************************/
    //                   Func                  //
    /*******************************************/
    
    fileprivate func setUpSubViewsLayout(){
        
        bgImg.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: -60, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: view.frame.width, height: view.frame.width*9/16, centerX: view.centerXAnchor, centerY: nil)
        bgImg.clipsToBounds = true
        
        //오토레이아웃잡기, addsubView를 해야 오토레이아웃할 수 있다
        //        photoBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.anchor(top: photoBtn.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 20, leftConstant: 00, rightConstant: 0, bottomContant: 0, width: view.frame.width*3/4, height: 0, centerX: view.centerXAnchor, centerY: nil)
        
        photoBtn.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 120, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: view.frame.width/4, height: view.frame.width/4, centerX: view.centerXAnchor, centerY: nil)
        //        photoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        //        photoBtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoBtn.layer.cornerRadius = view.frame.width/4/2
        //        photoBtn.layer.borderWidth = 1
        //        photoBtn.layer.borderColor = UIColor.rgbColor(31, 207, 255).cgColor
        
    }
    func photoActionHandel() {
        print("버튼눌림")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        //사진을 편집할수 있게 해줍니다
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info://",info)
        guard let userImg = info["UIImagePickerControllerEditedImage"] as? UIImage else {
            return
            //UIImagePickerControllerEditedImage 이게 있으면 이걸로
            //UIImagePickerControllerOriginalImage 이건 오리지날
        }
        photoBtn.setImage(userImg, for: .normal)
        photoBtn.clipsToBounds = true
        userImg.withRenderingMode(.alwaysOriginal)
        //버튼특성때문에 버튼색이바뀔수도있으니까 그냥 오리지널로 렌더하라는뜻입니다
        self.dismiss(animated: true, completion: nil)
    }
    
    func signupBtnHandler() {
        print("버튼눌림")
        
        guard let email = emailTextField.text else { return }
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passWordTextField.text!) { (user, error) in
            
            if let error = error {
                print("error://",error)
                return
            }
            
            //success
            guard let uid = user?.uid else { return }
            
            guard let image = self.photoBtn.imageView?.image else { return }
            guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
            //UI이미지를 제이펙으로 바꿔주고, 0.3은 압축률
            let uuid = UUID().uuidString
            //한번 호출할때마다 유니크한 숫자가 나온다 -> 이름이겹치지않음
            
            Storage.storage().reference().child("ProfileImage").child(uuid).putData(uploadData, metadata: nil, completion: { (metaData, error) in
                if let error = error
                {
                    print("error://",error)
                    return
                }
                print("metadata://",metaData)
                guard let urlStr = metaData?.downloadURL()?.absoluteString else { return }
                print(urlStr)
                self.navigationController?.popViewController(animated: true)
                
                
                Database.database().reference().child(uid).updateChildValues(["email": self.emailTextField.text!,"userName": self.userNameTextField.text!, "profileImage":urlStr], withCompletionBlock: { (error, ref) in
                    print("database error://",error)
                    print("database reference://",ref)
                    
                    //데이터가져옴
                    

                })
                
                
                
            })
        }
    }
    
    func handleTextInputChange(){
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && passWordTextField.text?.characters.count ?? 0 > 0 && userNameTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            signupBtn.isEnabled = true
            signupBtn.backgroundColor = UIColor.rgbColor(31, 207, 255)
        }else{
            signupBtn.isEnabled = false
            signupBtn.backgroundColor = UIColor.rgbColor(100, 100, 100)
        }
    }
}
