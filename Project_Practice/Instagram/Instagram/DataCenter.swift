//
//  DataCenter.swift
//  Instagram
//
//  Created by joe on 2017. 7. 26..
//  Copyright © 2017년 joe. All rights reserved.
//
import Foundation
import Firebase

class DataCenter {
    static let sharedData = DataCenter()
    
    var isLogin:Bool = false
    var userData:User?
    
    func requestIsLogin() -> Bool {
        if Auth.auth().currentUser == nil {
            isLogin = false
            return false
        }else{
            isLogin = true
            return true
            
        }
    }
    
    func requestUserData(completion:@escaping (_ info:User)->Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child(uid).observeSingleEvent(of: .value, with: { (snapShot) in
            let dic = snapShot.value as! [String:Any]
            //            self.userData = User(data: dic)
            completion(User(data: dic))
        })
        
    }
    
}



struct User {
    
    var userName:String?
    var profileImage:String?
    var email:String?
    
    init(data:[String:Any]) {
//        email = data["email"] as? String ?? ""
        email = Auth.auth().currentUser?.email
        userName = data["userName"] as! String ?? ""
        profileImage = data["profileImage"] as! String ?? ""
    }
}
