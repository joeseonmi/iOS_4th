//
//  MainViewController.swift
//  UserDefault
//
//  Created by joe on 2017. 5. 30..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    
    @IBOutlet weak var swicher: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwind(destination:UIStoryboardSegue){
        
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if swicher.selectedSegmentIndex == 0 {
            return true
        }else{
            return false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextView:ThirdViewController = segue.destination as! ThirdViewController
        nextView.data = "joe"
        
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
