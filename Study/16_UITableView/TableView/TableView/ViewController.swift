//
//  ViewController.swift
//  TableView
//
//  Created by joe on 2017. 6. 7..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    
 
    @IBOutlet weak var tv: UITableView!
    

    
//////////////////////////////////////////////////////////////////////////////
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userdata = UserDefaults.standard.array(forKey: "userlist") as? [[String:String]] ?? []
         tv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//////////////////////////////////////////////////////////////////////////////

    
    /*누른 세그에 따라서 정보를 다르게 주고싶오 정보를 줄라면 prepare을 써줘야디*/
    var userdata = UserDefaults.standard.array(forKey: "userlist") as? [[String:String]] ?? []
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdata.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var dictionary:[String:String] = userdata[indexPath.row]
        var username = dictionary["Name"]
        var usernumber = dictionary["Number"]
        
        cell.textLabel?.text = username
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "clickedAddBtn"
        {
            let nv:NextViewController = segue.destination as! NextViewController
            nv.isEditingMode = true
            nv.data = "5"
        }
        else if segue.identifier == "clickedCell"
        {
            let nv:NextViewController = segue.destination as! NextViewController
            nv.data = "6"

        }
    
    }
    
}

