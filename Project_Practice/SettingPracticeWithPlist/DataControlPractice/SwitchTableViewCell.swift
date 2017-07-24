//
//  SwitchTableViewCell.swift
//  DataControlPractice
//
//  Created by Hyoungsu Ham on 2017. 6. 20..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var titleOutlet: UILabel!
    
    var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(as text: String) {
        titleOutlet.text = text
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        delegate?.switchValueChanged(self, isOn: sender.isOn)
    }
}

protocol SwitchCellDelegate {
    func switchValueChanged(_ cell: SwitchTableViewCell, isOn: Bool)
}
