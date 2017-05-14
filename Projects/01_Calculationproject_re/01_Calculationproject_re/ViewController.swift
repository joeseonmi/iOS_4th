//
//  ViewController.swift
//  01_Calculationproject_re
//
//  Created by joe on 2017. 5. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displynum: UILabel!
    
    @IBAction func num1(_ sender: UIButton) {
        let displayingText: String = self.displynum.text!
        self.displynum.text = displayingText + "1"
    }
    @IBAction func num2(_ sender: UIButton) {
        let displayingText: String = self.displynum.text!
        self.displynum.text = displayingText + "2"
    }
    @IBAction func num3(_ sender: UIButton) {
        let displayingText: String = self.displynum.text!
        self.displynum.text = displayingText + "3"
    }
    @IBAction func num4(_ sender: UIButton) {
        let displayingText: String = self.displynum.text!
        self.displynum.text = displayingText + "4"
    }
    //위에는 뺀거
    @IBAction func num5(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "5"
    }
    //이거는 안뺀거(5) .이랑 !이거는 무슨의미로쓰는지모르겠다
    //View메뉴들 어떤식으로 사용해야되는지 궁금
    @IBAction func num6(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "6"
    }
    @IBAction func num7(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "7"
    }
    @IBAction func num8(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "8"
    }
    @IBAction func num9(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "9"
    }
    @IBAction func num0(_ sender: UIButton) {
        self.displynum.text = self.displynum.text! + "0"
    }
    @IBAction func dot(_ sender: UIButton) {
        self.displynum.text = "."
    }
    @IBAction func equal(_ sender: UIButton) {
    }
    @IBAction func plus(_ sender: UIButton) {
   
    }
    @IBAction func multip(_ sender: UIButton) {
        
    }
    @IBAction func subtrac(_ sender: UIButton) {
  
    }
    @IBAction func divis(_ sender: UIButton) {
        
    }
    @IBAction func clear(_ sender: UIButton) {
        
    }
    @IBAction func per(_ sender: UIButton) {
        
    }
    @IBAction func plm(_ sender: UIButton) {
        
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

