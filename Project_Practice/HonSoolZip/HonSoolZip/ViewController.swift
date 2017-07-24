//
//  ViewController.swift
//  HonSoolZip
//
//  Created by joe on 2017. 7. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    /*******************************************/
    //            Outlet & Property            //
    /*******************************************/
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    /*******************************************/
    //              life Cycle                 //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.register(UINib.init(nibName: "RecipeCustomCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
        print(DataCenter.standard.recipeList[0].drink.rawValue)
        print(DataCenter.standard.recipeList)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    /*******************************************/
    //                  Func                   //
    /*******************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.standard.recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RecipeCustomCell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCustomCell
        
        cell.recipeTitle.text = DataCenter.standard.recipeList[indexPath.row].name
        cell.cookTimeLabel.text = "\(DataCenter.standard.recipeList[indexPath.row].time)분"
        cell.mainRecipeImageView.image = UIImage(named: "\(DataCenter.standard.recipeList[indexPath.row].recipeID).jpg")
        cell.recipeScriptLabel.text = DataCenter.standard.recipeList[indexPath.row].shortDescription
        cell.iconView.image = UIImage(named: DataCenter.standard.selectAlchol(DataCenter.standard.recipeList[indexPath.row].drink.rawValue))
        cell.selectionStyle = .none
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC:DetailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        nextVC.receiveIndexPath = indexPath.row
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    

}

