//
//  DetailViewController.swift
//  Navigationbar
//
//  Created by joe on 2017. 6. 2..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titlelable: UILabel!
    @IBOutlet weak var imge: UIImageView!
    
    var imgName:String?
    var titleLB:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgName = self.imgName ?? "DefaultImageName"
        let titleLB = self.titleLB ?? "이름 모름"

        self.imge.image = UIImage(named: imgName)
        self.titlelable.text = "\(titleLB)"
       
        
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
