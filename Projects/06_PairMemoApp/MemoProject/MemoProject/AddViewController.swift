//
//  AddViewController.swift
//  MemoProject
//
//  Created by joe on 2017. 6. 11..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextViewDelegate {
    /*********************************************************/
    //                       let & var                       //
    /*********************************************************/
    
    
    /*********************************************************/
    //                  Button and Oulet                     //
    /*********************************************************/
   
    @IBAction func clickedDoneBtn(_ sender: UIButton) {
        //done버튼을 눌렀을때 유저디폴트에 저장되어야함
        saveMemo()
        letDismiss()
    }
    
    @IBAction func clickedBackBtn(_ sender: UIButton) {
        //back버튼을 눌렀을때, diss 되야함
        letDismiss()
    }
  
    @IBAction func priority(_ sender: UIButton) {
        //우선순위가 위에있는 버튼, 어레이인덱스 0에 저장해야한다.
        if sender.titleColor(for: .normal) == UIColor.lightGray{
            sender.setTitleColor(.red, for: .normal)
        }else{
            sender.setTitleColor(.lightGray, for: .normal)
        }
    
    }
    
    @IBOutlet weak var priorityBtn: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    /*********************************************************/
    //                       life cycle                      //
    /*********************************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    /*********************************************************/
    //                          func                         //
    /*********************************************************/
    
    //1. 창을 내려준다.
    func letDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //2. 에디팅을 시작할때 플레이스홀더를 없애준다.
    func textViewDidBeginEditing(_ textView: UITextView) {
        contentTextView.text = ""
        contentTextView.textColor = UIColor.black
    }
    
    //3. 적은 메모를 저장한다
    func saveMemo(){
        
        //"MemoList"라는 어레이를 호출한다.
        let addTitle:String = titleTextField.text!
        let addContent:String = contentTextView.text!
        var memo:[[String:String]] = UserDefaults.standard.array(forKey: "MemoList") as? [[String:String]] ?? []
        let eachMemos:[String:String] = ["title":addTitle, "content":addContent]
        
        if priorityBtn.titleLabel?.textColor == UIColor.lightGray {
            memo.append(eachMemos)
        }else{
            memo.insert(eachMemos, at: 0)
        }
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
