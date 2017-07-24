//
//  DetailVC.swift
//  HonSoolZip
//
//  Created by joe on 2017. 7. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    /*******************************************/
    //           Outlet & Property             //
    /*******************************************/
    
    var receiveIndexPath:Int!
    
    @IBOutlet weak var mainRecipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var shorTitle: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var ingrediantsLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    /*******************************************/
    //              life Cycle                 //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainRecipeImage.image = UIImage(named: "\(DataCenter.standard.recipeList[receiveIndexPath].recipeID).jpg")
        self.recipeTitle.text = DataCenter.standard.recipeList[receiveIndexPath].name
        self.shorTitle.text = DataCenter.standard.recipeList[receiveIndexPath].shortDescription
        self.costLabel.text = "\(DataCenter.standard.recipeList[receiveIndexPath].cost)"
        self.cookTimeLabel.text = "\(DataCenter.standard.recipeList[receiveIndexPath].time)"
        self.ingrediantsLabel.text = DataCenter.standard.recipeList[receiveIndexPath].ingrediants
        self.detailLabel.text = DataCenter.standard.recipeList[receiveIndexPath].detail

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
