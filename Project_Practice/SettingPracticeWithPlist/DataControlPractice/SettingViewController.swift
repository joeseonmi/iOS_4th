//
//  SettingViewController.swift
//  DataControlPractice
//
//  Created by Hyoungsu Ham on 2017. 6. 20..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingCenter.sharedSetting.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellStyle = SettingCenter.sharedSetting.cellStyleForRow(at: indexPath)

        
        switch cellStyle {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleForRow(at: indexPath)
            cell.selectionStyle = .blue
            
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle.rawValue, for: indexPath)
            cell.textLabel?.text = SettingCenter.sharedSetting.titleForRow(at: indexPath)
            cell.selectionStyle = .none
            
            return cell
        case .Switch:
            let cell: SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellStyle.rawValue, for: indexPath) as! SwitchTableViewCell
            cell.setTitle(as: SettingCenter.sharedSetting.titleForRow(at: indexPath))
            cell.selectionStyle = .gray
            cell.delegate = self
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            callAlert()
        }
    }
    
    func switchValueChanged(_ cell: SwitchTableViewCell, isOn: Bool) {
        print("Switch value changed to \(isOn)")
        if isOn{
        autoLogin()
        }
    }
    
    func callAlert(){
        
        let alert:UIAlertController = UIAlertController.init(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction.init(title: "확인", style: .default) { (check:UIAlertAction) in
            self.logoutRequest()
        }
        let cancelBtn:UIAlertAction = UIAlertAction.init(title: "취소", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    func logoutRequest(){
        UserDefaults.standard.set(false, forKey:"logInStatus")
        print("로그아웃대따")
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
//        let loginVC:LoginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        self.present(loginVC, animated: true, completion: nil)
    }
    
    func userDelete(){
            //데이터센터 루트어레이에서 필터로 해당 유저 네임 찾아서 리무브해줌
        
    }
    
    func autoLogin(){
        UserDefaults.standard.set(true, forKey: "logInStatus")
    }
    
    
}
