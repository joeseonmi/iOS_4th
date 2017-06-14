//
//  ReadViewController.swift
//  MemoProject
//
//  Created by joe on 2017. 6. 11..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    /*********************************************************/
    //                       프로퍼티                          //
    /*********************************************************/
    
    var getIndex:Int?
    var getMemoList:[[String:String]]?
    
    
    /*********************************************************/
    //                         outlet                        //
    /*********************************************************/
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var priorityBtn: UIButton!
  
    @IBAction func clickedPriorityBtn(_ sender: UIButton) {
    }
    @IBAction func clickedDoneBtn(_ sender: UIButton) {
        
        editMemo()
        self.navigationController?.popViewController(animated: true)
    }
    
    /*********************************************************/
    //                       life cycle                      //
    /*********************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBtn.isHidden = true
        
        let memoList:[String:String] = getMemoList![getIndex!]
        titleTextField.text = memoList["title"]
        contentTextView.text = memoList["content"]


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    /*********************************************************/
    //                          func                         //
    /*********************************************************/

   
    //1.사용자가 에디팅을 시작하면 done버튼이 나타난다
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        doneBtn.isHidden = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        doneBtn.isHidden = false
    }
    //2. save
    func editMemo(){
        
        //"MemoList"라는 어레이를 호출한다.
        let addTitle:String = titleTextField.text!
        let addContent:String = contentTextView.text!
        var memo:[[String:String]] = UserDefaults.standard.array(forKey: "MemoList") as? [[String:String]] ?? []
        let eachMemos:[String:String] = ["title":addTitle, "content":addContent]
        
        memo.remove(at: getIndex!)
        memo.insert(eachMemos, at: getIndex!)
        
        UserDefaults.standard.set(memo, forKey: "MemoList")
   
        //타이틀과 컨텐츠를 가진 딕셔너리를 감싼 어레이를 저장하는 함수

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
