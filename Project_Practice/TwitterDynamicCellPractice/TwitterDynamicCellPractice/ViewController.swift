//
//  ViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITextViewDelegate {

    /*******************************************/
    //           Outlet & Property             //
    /*******************************************/
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpTopConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var textCharctersCount: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clickedAddBtn: UIButton!
    @IBAction func clickedSaveBtn(_ sender: UIButton) {
        
    }
    @IBAction func clickedCanCelBtn(_ sender: UIButton) {
        blackout.isHidden = true
        popUpTopConstraints.constant = -320
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        view.endEditing(true)
        textView.text = "정신차려 박뽀영!"
    }
    
    @IBAction func clickedAddBtn(_ sender: UIButton)
    {
        blackout.isHidden = false
        popUpTopConstraints.constant = 60
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
 
    
    @IBOutlet weak var whitePopUP: UIView!
    @IBOutlet weak var blackout: UIView!
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let addtext = textView.text else { return true }
        let newLength = addtext.characters.count + text.characters.count - range.length
        return newLength <= 140
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textCharctersCount.text = "\(textView.text.characters.count)"+" / 140"
    }
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        whitePopUP.layer.cornerRadius = 20
        
        print(DataCenter.shared.dataArray)
        
        blackout.isHidden = true
        
        let dynamiccustomCell:UINib = UINib(nibName: "DynamicCustomCell", bundle: nil)
        tableView.register(dynamiccustomCell, forCellReuseIdentifier: "Cell")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*******************************************/
    //                TableView                //
    /*******************************************/
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DynamicCustomCell
        
        cell.user_ID.text = DataCenter.shared.dataArray[indexPath.row].userId
        cell.userNickName.text = DataCenter.shared.dataArray[indexPath.row].userName
        cell.contentText.text = DataCenter.shared.dataArray[indexPath.row].bodyText
        cell.profilePhoto.setImage(UIImage(named: DataCenter.shared.dataArray[indexPath.row].userPhotoUrl), for: .normal)
        
        if let realImageUrl = DataCenter.shared.dataArray[indexPath.row].imageUrl {
            cell.uploadImage.setImage(UIImage(named: realImageUrl), for: .normal)
        }else{
            cell.uploadImage.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

