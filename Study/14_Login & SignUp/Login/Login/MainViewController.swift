//
//  MainViewController.swift
//  Login
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBAction func unwindF(toMain: UIStoryboardSegue){}

    @IBAction func clickLogout(_ sender: UIButton) {
        
        isAuthentified = false
        
        self.performSegue(withIdentifier: "LoginViewVontrollerSegue", sender: self)
        
    }
    
    var isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
    //이 클래스가 이니셜라이즈 될때 authentification을 보고 불값을 찾아왕

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        //얘가 true인지  false인지를 받아서
        
        if !isAuthentified{
            self.performSegue(withIdentifier: "LoginViewVontrollerSegue", sender: self)
            //로그인되면 값이 true로 바뀌는데 트루가 아니라면 로그인화면으로 가라. 로그인 버튼 함수에 로그인성공하면 유져디폴트값에 이거를 true로 바꾸라는 명령어가 있음
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

}
