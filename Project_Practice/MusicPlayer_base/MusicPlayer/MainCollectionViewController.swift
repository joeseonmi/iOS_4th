//
//  MainCollectionViewController.swift
//  MusicPlayer
//
//  Created by joe on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //유아이콜렉션뷰델리게이트플로우레이아웃: 사이즈포 아이템 쓰려고
    /*******************************************/
    //                  Outlet                 //
    /*******************************************/
    
    let dataSource = SongDataSource()
    @IBOutlet var mainCollectionView: UICollectionView!
    @IBOutlet weak var coverLayout: CoverFlowLayout!
    
    @IBAction func clickedRandomPlay(_ sender: UIButton) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController{
            let randomID = Int(arc4random_uniform(29))
            let randomMusic = dataSource.getSongData(withID: randomID)
            nextVC.setSong(data:randomMusic)
            self.navigationController?.pushViewController(nextVC, animated: true)

        }
    }
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        let insetSide = mainCollectionView.bounds.size.width / 4
        coverLayout.sectionInset = UIEdgeInsets(top: 0, left: insetSide, bottom: 0, right: insetSide)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*******************************************/
    //                  Func                   //
    /*******************************************/
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController{
            
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
            nextVC.setSong(data: cell.songData!)
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.numberOfItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
    
        if let newData = dataSource.cellForSongData(at: indexPath.item){
            cell.setSongData(newData)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width/2
        let height = collectionView.bounds.size.height/2
        return CGSize(width: width, height: height)
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
