//
//  RecipeCustomCell.swift
//  HonSoolZip
//
//  Created by joe on 2017. 7. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class RecipeCustomCell: UITableViewCell {
    
    @IBOutlet weak var mainRecipeImageView: UIImageView!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeScriptLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

           }
    
}
