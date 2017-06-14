//
//  ViewController.swift
//  TableViewCustom
//
//  Created by joe on 2017. 6. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*********************************************************/
    //                  Button and Oulet                     //
    /*********************************************************/

    @IBOutlet weak var tv: UITableView!
    
    /*********************************************************/
    //                      Life Cycle                       //
    /*********************************************************/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
             self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*********************************************************/
    //                         func                          //
    /*********************************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TripData.mainTitleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.bgimg.image = UIImage(named:"00\(indexPath.row).jpg")
        cell.tripCity.text = TripData.tripCity[indexPath.row]
        cell.mainTitleLabel.text = TripData.mainTitleLabel[indexPath.row]
        cell.tripDate.text = TripData.tripDate[indexPath.row]
        cell.cityName.text = TripData.cityName[indexPath.row]
        cell.priceLable.text = TripData.priceLable[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC:DetailViewController = segue.destination as! DetailViewController
        
        let clickedCell = sender as! UITableViewCell
        nextVC.getIndex = self.tv.indexPath(for: clickedCell)?.row
        
        
        
    }
}

