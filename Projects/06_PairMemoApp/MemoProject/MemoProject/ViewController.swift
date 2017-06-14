//
//  ViewController.swift
//  MemoProject
//
//  Created by joe on 2017. 6. 11..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /*********************************************************/
    //                       프로퍼티                          //
    /*********************************************************/
    var memoList:[[String:String]]?
    
    /*********************************************************/
    //                  Button and Oulet                     //
    /*********************************************************/
    @IBOutlet weak var tv: UITableView!
    
    /*********************************************************/
    //                       life cycle                      //
    /*********************************************************/
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //업로드 하는 코드 보기
        loadData()
        tv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*********************************************************/
    //                      table View                       //
    /*********************************************************/
    
    
    //table view의 row를 정해준다. 나중에 유저디폴트에 따라서 갯수를 정해줄거임
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList?.count ?? 0
        //메모리스트가 nil일때는 디폴트를 0으로 준다
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell을 재활용해야하기때문에 넣어준다. identifier가 Cell인 셀을 재활용 한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var titleDic = memoList?[indexPath.row]
        
        cell.textLabel?.text = titleDic?["title"]
        
        return cell
    }
    
    /*********************************************************/
    //                          func                         //
    /*********************************************************/
    
    //1. 업로드
    func loadData(){
        memoList = UserDefaults.standard.array(forKey: "MemoList") as? [[String:String]] ?? []
    }
    
    //2. VC에서 ReadVC로 정보를 넘겨줘야댐
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cellClickedSegue" {
            let nextVC:ReadViewController = segue.destination as! ReadViewController
            
            let cell = sender as! UITableViewCell
            
            nextVC.getIndex = self.tv.indexPath(for: cell)?.row
            nextVC.getMemoList = self.memoList
        }
    }


}

