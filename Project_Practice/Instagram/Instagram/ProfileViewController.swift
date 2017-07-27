//
//  ProfileViewController.swift
//  Instagram
//
//  Created by joe on 2017. 7. 25..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "Header"

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var userData:User?{
        didSet{
            self.collectionView?.reloadData()
            self.navigationItem.title = userData?.email
        }
    }
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if DataCenter.sharedData.isLogin && userData == nil {
            DataCenter.sharedData.requestUserData(completion: { (user) in
                self.userData = user
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        //naviSetting
        let settingBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "gear"), style: .plain, target: self, action: #selector(handlerSetting))
        self.navigationItem.rightBarButtonItem = settingBtn
        
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.register(ProfileInfoHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    
    //레지스터에서 추가한다(헤더를) 서플러멘터리에서 헤더를 추가해줬음
    //셀 foritem처럼 viewforSuppl~ 해주면됨
    //헤더 사이즈 정해줌
    // 그냥 컬렉션뷰 만드는거랑 비슷하다
    
    /*******************************************/
    //              collectionView             //
    /*******************************************/
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .gray

        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.size.width-2)/3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell:ProfileInfoHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! ProfileInfoHeader
        
        if let userData = self.userData {
            cell.user = userData
        }
        
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    /*******************************************/
    //              Func in Header             //
    /*******************************************/
    
    func handlerSetting(){

        do {
            try Auth.auth().signOut()
            //tapBar에게 로그인창 띄우라고 요청해줘야됨
            let tabbar:mainTabBarController? = self.tabBarController as? mainTabBarController
            tabbar?.showLoginVC()
            tabbar?.selectedViewController = tabbar?.viewControllers?[0]
        }catch{
            
        }
        
    }
    
    func didSelectedGridBtn() {
        print("젭알!!!!!!!!!!!!!!!!!!")
    }
    
}

