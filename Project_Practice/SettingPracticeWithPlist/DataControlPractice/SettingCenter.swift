//
//  SettingCenter.swift
//  DataControlPractice
//
//  Created by Hyoungsu Ham on 2017. 6. 20..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import Foundation

enum CellStyle: String {
    case Detail = "SettingDetailCell"
    case Basic = "SettingBasicCell"
    case Switch = "SettingSwitchCell"
}


class SettingCenter {
    
    static let sharedSetting: SettingCenter = SettingCenter()
    var settingData: [Any]?
    
    // init
    private init() {
        loadData()
    }
    
    
    // 데이터 로드
    func loadData() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"), let data = NSArray(contentsOfFile: path) {
            settingData = data as? [Any]
        }
    }
    
    
    // number of section
    func numberOfSection() -> Int {
        return settingData?.count ?? 0
    }
    
    // titles of section
    func titleFor(section: Int) -> String {
        
        guard let data = settingData else {
            return "no data"
        }
        
        let itemAsDic: [String: Any] = data[section] as! [String : Any]
        let sectionTitle: String = itemAsDic["SectionTitle"] as! String
        
        return sectionTitle
    }
    
    
    // number of rows
    func numberOfRowsIn(section: Int) -> Int {
        
        guard let data = settingData else {
            return 0
        }
        
        let itemAsDic: [String: Any] = data[section] as! [String : Any]
        let dataInArray = itemAsDic["Data"] as? [Any]
        
        if let itemsInData = dataInArray {
            return itemsInData.count
        } else {
            return 0
        }
    }
    
    // cell title 가져오기
    func titleForRow(at indexPath: IndexPath) -> String {
        
        guard let data = settingData else {
            return ""
        }
        
        let itemAsDic: [String: Any] = data[indexPath.section] as! [String : Any]
        let dataAsArray: [Any] = itemAsDic["Data"] as! [Any]
        let item: [String: Any] = dataAsArray[indexPath.row] as! [String : Any]
        
        let title: String = item["Content"] as! String
        
        return title
    }
    
    // cell style 가져와서 enum에 넣기
    
    func cellStyleForRow(at indexPath: IndexPath) -> CellStyle {
        guard let data = settingData else {
            return .Basic
        }
        
        let itemAsDic: [String: Any] = data[indexPath.section] as! [String : Any]
        let dataAsArray: [Any] = itemAsDic["Data"] as! [Any]
        let item: [String: Any] = dataAsArray[indexPath.row] as! [String : Any]
        let cellStyle: String = item["CellStyle"] as! String
        
        return CellStyle.init(rawValue: cellStyle)!
    }
    
    

    

    
}
