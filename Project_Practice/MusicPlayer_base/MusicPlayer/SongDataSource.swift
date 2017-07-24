//
//  SongDataSource.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class SongDataSource {
    
    private var songMetaDataArray:[SongMetaData] = []
    
    init(){
        getMetaData()
    }
    
    var numberOfItems:Int{
        return songMetaDataArray.count 
    }
    
    func cellForSongData(at index:Int) -> SongMetaData? {
        return  songMetaDataArray[index]
    }
    
    func getMetaData()
    {
    
        for i in 0..<30
        {
            //카운트가 노래이름(여기서는)
            let count:String = "\(i)"
            if let fileURL = Bundle.main.url(forResource: count, withExtension: "mp3")
            {
                let asset:AVAsset = AVURLAsset(url: fileURL, options: nil)
                //URL을 통해 에셋을 가져와서 넣눈다
                //하나의 노래를 에셋으로만든다, 에셋을 가지고 메타데이터를 만든다 , 메타데이터를가지고 송메타데이터를 뽑는다. 그리고 송 데이터를 어레이에다 집어넣어줌
                let metaData:[AVMetadataItem] = asset.commonMetadata
                let songData = SongMetaData(metaData: metaData, id: i)
                songMetaDataArray.append(songData)
            }else
            {
                print("file이 없음")
            }
        }
    }
    
    
    // ID를 받아서 해당 메타 데이터를 뽑는
    func getSongData(withID id:Int) -> SongMetaData
    {
        
        let getDatas = songMetaDataArray.filter { (data) -> Bool in
            data.songID == id
        }
        
        return getDatas[0]
        
    }
    
}
