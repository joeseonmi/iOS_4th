//
//  ViewController.swift
//  DataControlPractice
//
//  Created by Hyoungsu Ham on 2017. 6. 20..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(SettingCenter.sharedSetting.numberOfRowsIn(section: 1))
        print(SettingCenter.sharedSetting.titleForRow(at: IndexPath(row: 0, section: 0)))
        print(SettingCenter.sharedSetting.cellStyleForRow(at: IndexPath(row: 0, section: 0)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

