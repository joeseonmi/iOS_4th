//
//  NextViewController.swift
//  TableView
//
//  Created by joe on 2017. 6. 7..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var clickedSave: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBAction func clickedSave(_ sender: UIButton) {
        
        let name = self.nameTextField.text!
        let number = self.numberTextField.text!
        var userinfoArray = UserDefaults.standard.array(forKey:"userlist") as? [[String : String]]
        
        if userinfoArray == nil {
            userinfoArray = [["Name":name, "Number":number]]
        }else{
            userinfoArray!.append(["Name":name, "Number":number])
        }
        UserDefaults.standard.set(userinfoArray, forKey: "userlist")
        print(UserDefaults.standard.array(forKey: "userlist") ?? 00)
        
    }
    
    var data:String?
    var isEditingMode = false
    
    
    
    
    /********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = data
        
        if !isEditingMode{
            clickedSave.isHidden = true
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /********************************************/
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
