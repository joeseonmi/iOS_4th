//  MusicDetailViewController.swift
//  MusicPlayer
//
//  Created by joe on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation


class MusicDetailViewController: UIViewController {
    
    
    /*******************************************/
    //            Outlet & Property            //
    /*******************************************/
    var player:AVPlayer?
    
    private var songData:SongMetaData!
    let dataSource = SongDataSource()
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var preSongBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var nextSongBtn: UIButton!
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playBtn(_ sender: UIButton)
    {
        if playBtn.image(for: .normal) == #imageLiteral(resourceName: "playWhite"){
            playBtn.setImage(#imageLiteral(resourceName: "pauseWhite"), for: .normal)
            player?.play()
        }else{
            playBtn.setImage(#imageLiteral(resourceName: "playWhite"), for: .normal)
            player?.pause()
        }
    }
    
    @IBAction func preSongBtn(_ sender: UIButton) {
        //getsongData 부터 안돌음
        if songData.songID == 0 {
            callAlert()
        }else{
            
            let preSongData:SongMetaData = dataSource.getSongData(withID: songData.songID!-1)
            setSong(data: preSongData)
            //예외처리해주기 막곡일때랑 첫곡일때 뒤로/앞으로 못가게
            let fileName = "\(songData.songID!)"
            playMusic(forResource: fileName)
        }
        
    }
    @IBAction func nextSongBtn(_ sender: UIButton) {
        //이거 눌렀을때 다음곡의 메타데이터를 받아야됨
        if songData.songID == 29 {
            callAlert()
        }else{
            
            let nextSongData:SongMetaData = dataSource.getSongData(withID: songData.songID!+1)
            setSong(data: nextSongData)
            //예외처리해주기 막곡일때랑 첫곡일때 뒤로/앞으로 못가게
            let fileName = "\(songData.songID!)"
            playMusic(forResource: fileName)
        }
        
    }
    
    /*******************************************/
    //                  Func                   //
    /*******************************************/
    //오류 알럿
    func callAlert(){
        let alert:UIAlertController = UIAlertController.init(title: "오류", message: "다음곡이 없습니다", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    
    //음악재생
    func playMusic(forResource fileName:String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        {
            player = AVPlayer(url:url)
        }
        player?.play()
        updateUI(data: self.songData)
    }
    
    
    func setSong(data:SongMetaData){
        songData = data
    }
    
    
    func updateUI(data: SongMetaData){
        songTitle.text = data.albumName
        artistName.text = data.artistName
        albumArt.image = data.albumImg
    }
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let fileName = "\(songData.songID!)"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        {
            player = AVPlayer(url:url)
        }
        player?.play()
        updateUI(data: self.songData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
