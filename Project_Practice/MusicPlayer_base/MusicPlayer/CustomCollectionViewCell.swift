//
//  CustomCollectionViewCell.swift
//  MusicPlayer
//
//  Created by joe on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    
    private var data:SongMetaData?
    var songData:SongMetaData?{
        return data
    }
    
    
    func setSongData(_ songData:SongMetaData){
        data = songData
        
        if let title = songData.songTitle{
            titleLabel.text = title
        }
        if let img = songData.albumImg{
            albumArt.image = img
        }
        
        
    }
}
