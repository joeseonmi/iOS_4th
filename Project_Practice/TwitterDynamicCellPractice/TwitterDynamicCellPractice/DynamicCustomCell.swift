//
//  DynamicCustomCell.swift
//  TwitterDynamicCellPractice
//
//  Created by joe on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class DynamicCustomCell: UITableViewCell {

    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var user_ID: UILabel!
    @IBOutlet weak var contentText: UILabel!

    @IBOutlet weak var uploadImage: UIButton!
    @IBOutlet weak var profilePhoto: UIButton!
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
