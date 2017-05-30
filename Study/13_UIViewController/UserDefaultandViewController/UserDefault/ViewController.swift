//
//  ViewController.swift
//  UserDefault
//
//  Created by joe on 2017. 5. 30..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
//        UserDefaults.standard.set("joe", forKey: "name")
//        UserDefaults.standard.set("29", forKey: "age")
        
        let firstname:String = UserDefaults.standard.string(forKey: "name")!
        let userAge:String = UserDefaults.standard.object(forKey: "age") as! String
        
        self.label.text = "\(firstname),\(userAge)"
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

