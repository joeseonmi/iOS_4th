//
//  SecondViewController.swift
//  PracticeUIViewAndTextfield
//
//  Created by joe on 2017. 5. 31..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var nameData:String?
    var genderData:String?
    var ageData:String?
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = nameData, let gender = genderData, let age = ageData {
            self.labelDisplay.text = "\(age)살 \(name)님은 \(gender)"
        }
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
