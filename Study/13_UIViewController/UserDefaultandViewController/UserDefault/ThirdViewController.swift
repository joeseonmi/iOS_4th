//
//  ThirdViewController.swift
//  UserDefault
//
//  Created by joe on 2017. 5. 30..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var data:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = data {
            print(name)
        }
        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
