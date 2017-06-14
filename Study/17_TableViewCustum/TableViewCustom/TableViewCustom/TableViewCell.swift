//
//  TableViewCell.swift
//  TableViewCustom
//
//  Created by joe on 2017. 6. 12..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    /*********************************************************/
    //                  Button and Oulet                     //
    /*********************************************************/
    
    @IBOutlet weak var bgimg: UIImageView!
    @IBOutlet weak var tripCity: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    
    /*********************************************************/
    //                      Life Cycle                       //
    /*********************************************************/

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    /*********************************************************/
    //                         func                          //
    /*********************************************************/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
