//
//  MainViewController.swift
//  Login
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

enum ArletMessege:String {
    
    case arletTitle = "로그아웃할까요"
    case arletmessage = "진짜루?"
    case buttonYes = "넴"
    case buttonNo = "아니오"
    
}
/* enum 은오류처리할때 쓰면 좋음

 예를들면 이넘 안에 오류메세지가 뜰수있는 상황을 적어놓고
 스위치문을 써서 오류상황마다 Switch문으로 알럿의 타이틀을 바꿔주면됨
 알럿의 타이틀에는 스위치문을 썼던 함수를 넣어주면 자동으로 바뀜
 */

class MainViewController: UIViewController {
    
    
    @IBAction func unwindF(toMain: UIStoryboardSegue){}

    @IBAction func clickLogout(_ sender: UIButton) {
        
        let check:UIAlertController = UIAlertController(title: ArletMessege.arletTitle.rawValue, message: ArletMessege.arletmessage.rawValue, preferredStyle: .alert)
        //로그아웃을 확인하는 얼럿을 띄운다
        
        let btn:UIAlertAction = UIAlertAction(title: ArletMessege.buttonYes.rawValue, style: .default, handler: {(check:UIAlertAction) in self.isAuthentified = false; let vc:LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController;self.present(vc, animated: true, completion: nil)})
        //예 버튼 -> 예 버튼을 누르면 self.isAuthentified 를 false로(로그인이 되어있는지 확인하는거) 로그인 뷰 컨트롤러를 띄운다.
        
        let cancel:UIAlertAction = UIAlertAction(title: ArletMessege.buttonNo.rawValue, style: .cancel, handler: nil)
        
        check.addAction(btn)
        check.addAction(cancel)
        // check얼럿에 addAcion얼럿 액션 추가해줌
        
        self.present(check, animated: true, completion: nil)
        //얼럿을 띄운다.
      

    }
    
    var isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
    //이 클래스가 이니셜라이즈 될때 authentification을 보고 불값을 찾아왕

    
    //////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //////////////////////////////////////////////////////////////////////////
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isAuthentified: Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        //얘가 true인지  false인지를 받아서
        
        super.viewDidAppear(animated)
        if !isAuthentified{
            
//           // 인스턴스생성
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            
//            //이동
            
            let vc:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            //vc는 ID가 NavigationController인 UINavigationController임(로그인화면인듯) 이거 띄워주셈
            self.present(vc, animated: true, completion: nil)
//
//            self.performSegue(withIdentifier: "LoginViewVontrollerSegue", sender: self)
//            //로그인되면 값이 true로 바뀌는데 트루가 아니라면 로그인화면으로 가라. 로그인 버튼 함수에 로그인성공하면 유져디폴트값에 이거를 true로 바꾸라는 명령어가 있음
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
