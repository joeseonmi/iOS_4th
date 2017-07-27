//
//  ProfileInfoHeader.swift
//  Instagram
//
//  Created by joe on 2017. 7. 25..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit



class ProfileInfoHeader: UICollectionViewCell {


    /*******************************************/
    //                 Property                //
    /*******************************************/

    var user:User? {
        didSet{
            profileText.text = user?.userName
            if let urlStr = user?.profileImage,
                let url = URL(string: urlStr)
            {
             
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let err = error
                    {
                        return
                    }
                    guard let realDAta = data else { return }
                    
                    DispatchQueue.main.async {
                        self.profileImage.setImage(UIImage(data: realDAta), for: .normal)
                    }
                    
            
                }.resume()
            }
        }
    }
    
    let profileImage:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        btn.isUserInteractionEnabled = false
        btn.layer.cornerRadius = 200 * 2 / 5 / 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let editProfileBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Edit Profile", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.rgbColor(100, 100, 100).cgColor
        return btn
    }()
    
    let gridTypeBtn:UIButton = {
        let btn = UIButton(type: .system)
        //버튼색 바꾸려면 .System으로 바꿔주는데 타입은 커스텀, 시스템이있다.
        //커스텀일 경우 무조건 원본이미지로 세팅된다
        //시스템으로 주면 시스템이 알아서 바꿔줌
        btn.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        btn.addTarget(self, action: #selector(ProfileViewController.didSelectedGridBtn) , for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let listTypeBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        btn.addTarget(self, action: #selector(ProfileViewController.didSelectedGridBtn), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let ribbonTypeBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
         btn.addTarget(self, action: #selector(ProfileViewController.didSelectedGridBtn), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    

    
    let postLabel:UILabel = {
        let label = UILabel()
        let attributes = NSMutableAttributedString(string: "222\n", attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)])
        let post = NSMutableAttributedString(string: "posts", attributes: [NSForegroundColorAttributeName : UIColor.lightGray,NSFontAttributeName:UIFont.systemFont(ofSize: 10)])
        
        attributes.append(post)
        label.attributedText = attributes
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    let followersLabel:UILabel = {
        let label = UILabel()
        let attributes = NSMutableAttributedString(string: "323\n", attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)])
        let post = NSMutableAttributedString(string: "followers", attributes: [NSForegroundColorAttributeName : UIColor.lightGray,NSFontAttributeName:UIFont.systemFont(ofSize: 10)])
        
        attributes.append(post)
        label.attributedText = attributes
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    
    let followingLabel:UILabel = {
        let label = UILabel()
        let attributes = NSMutableAttributedString(string: "323\n", attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)])
        let post = NSMutableAttributedString(string: "following", attributes: [NSForegroundColorAttributeName : UIColor.lightGray,NSFontAttributeName:UIFont.systemFont(ofSize: 10)])
        
        attributes.append(post)
        label.attributedText = attributes
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    let profileText:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.rgbColor(100, 100, 100)
        return label
    }()
    
    let segmentButtonStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    let labelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()
    
    let firstLine:UIView = {
    
        let lineView = UIView()
        lineView.backgroundColor = UIColor.rgbColor(230, 230, 230)
        
        return lineView
    }()
    
    /*******************************************/
    //               Life Cycle                //
    /*******************************************/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //객체를 만드는데있어서 제일중요한게 이닛이다
        //이닛이 두개야 이닛위드프레임을 만들어서
        //엔에스오브젝트를 상속받아서 실행한 아이다
        self.addSubview(profileImage)
        profileImage.clipsToBounds = true
        labelStackView.addArrangedSubviews([postLabel,followersLabel,followingLabel])
        self.addSubview(editProfileBtn)
        self.addSubview(labelStackView)
        stackView.addArrangedSubviews([labelStackView,editProfileBtn])
        self.addSubview(stackView)
        self.addSubview(profileText)
        segmentButtonStackView.addArrangedSubviews([gridTypeBtn,listTypeBtn,ribbonTypeBtn])
        self.addSubview(segmentButtonStackView)
        self.addSubview(firstLine)
        setLaoutSubViews()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*******************************************/
    //                  Func                   //
    /*******************************************/
    
    func setLaoutSubViews(){
        
        
        profileImage.anchor(top: self.topAnchor, left: self.leftAnchor, right: nil, bottom: nil, topConstant: 30, leftConstant: 10, rightConstant: 0, bottomContant: 0, width: self.frame.height * 2/5, height: self.frame.height * 2/5, centerX: nil, centerY: nil)
        
        
        stackView.anchor(top: self.topAnchor, left: profileImage.rightAnchor, right: self.rightAnchor, bottom: nil, topConstant: 30, leftConstant: 20, rightConstant: 20, bottomContant: 0, width: 0 , height: self.frame.height * 2/5, centerX: nil, centerY: nil)
        
        profileText.anchor(top: profileImage.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 0, leftConstant: 10, rightConstant: 10, bottomContant: 0, width: 0, height: 30, centerX: nil, centerY: nil)
        
        segmentButtonStackView.anchor(top: nil, left: self.leftAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: 0, height: 44, centerX: nil, centerY: nil)
        
        firstLine.anchor(top: nil, left: self.leftAnchor, right: self.rightAnchor, bottom: segmentButtonStackView.topAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomContant: 0, width: 0, height: 1, centerX: nil, centerY: nil)
        
    }

}
