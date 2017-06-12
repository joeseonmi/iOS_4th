//
//  DetailViewController.swift
//  TableViewCustom
//
//  Created by joe on 2017. 6. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    /* property * outlet ********************************************/
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var contentsTextView: UITextView!
    
    var getIndex:Int?
    
    /* life Cycle ***************************************************/
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        self.mainImg.image = UIImage(named:"00\(getIndex ?? 00).jpg")
        self.contentsTextView.text = TripData.mainTitleLabel[getIndex!]
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
