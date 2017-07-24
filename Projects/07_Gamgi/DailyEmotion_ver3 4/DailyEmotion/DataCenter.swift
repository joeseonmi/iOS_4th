//
//  DataCenter.swift
//  Hackerthon
//
//  Created by Hyoungsu Ham on 2017. 7. 6..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import Foundation

var sevenDayKey:Bool = false

func emotion(from emotion:[Emotion]) -> String
{
    var happyCount = 0
    var joyCount = 0
    var gladCount = 0
    var breathighCount = 0
    var displeasureCount = 0
    var angerCount = 0
    var melancholyCount = 0
    var sadCount = 0
    for i in emotion
    {
        switch i {
        case .happy:
            happyCount += 1
        case .joy:
            joyCount += 1
        case .glad:
            gladCount += 1
        case .breathigh:
            breathighCount += 1
        case .displeasure:
            displeasureCount += 1
        case .anger:
            angerCount += 1
        case .melancholy:
            melancholyCount += 1
        default:
            sadCount += 1
            
        }
    }
    
    let allArray = [happyCount, joyCount, gladCount, breathighCount, displeasureCount, angerCount, melancholyCount, sadCount]
    
    func intNum(from:[Int]) -> [Int]
    {
        var tempNumArray:[Int] = []
        let maxNum = from.max()!
        var tempNum = 0
        
        for i in 0...from.count - 1
        {
            
            if from[tempNum] == maxNum
            {
                tempNumArray.append(i)
                tempNum += 1
            }else
            {
                tempNum += 1
            }
        }
        return tempNumArray
    }
    let tempNum:[Int] = intNum(from: allArray)
    
    let tempEmotionArray = ["행복한“,”기쁜“,”신나는“,”두근두근한“,”우울한“,”화나는“,”짜증나는“,”슬픈"]
    var realEmotion:String = ""
    
    for i in tempNum
    {
        realEmotion = realEmotion + "\(tempEmotionArray[i]) "
    }
    realEmotion += "날이 많았네요"
    return realEmotion
}

class DataCenter {
    
    static var standard: DataCenter = DataCenter()
    
    var rawArray: [User] = []
    
    var user: User?    
    
    private let fileManager: FileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Users.plist"
    
    
    private init() {
        
        if UserDefaults.standard.bool(forKey: "logInStatus") {
            setUser()
        }
        
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            loadFromBundle()
        }
    }
    
    func loadFromBundle() {
        if let bundlePath: String = Bundle.main.path(forResource: "Users", ofType: "plist"), let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String: Any]] {
            
            self.rawArray = loadedArray.map({ (dictionary: [String: Any]) -> User in
                return User.init(dictionary: dictionary)
            })
            
            try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
        }
    }
    
    func loadFromDoc() {
        
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String: Any]] {
            
            self.rawArray = loadedArray.map({ (dictionary: [String: Any]) -> User in
                return User.init(dictionary: dictionary)
            })
        }
    }
    
    func saveToDoc() {
        
        editUser()
        
        var tempArray: [[String: Any]] = [[:]]
        
        for i in rawArray {
            
            if i.userNumber == 0 {
                tempArray[0] = i.dictionary
            } else {
                tempArray.append(i.dictionary)
            }
        }
        
        let nsArray: NSArray = NSArray(array: tempArray)
        
        nsArray.write(toFile: docPath, atomically: true)
        
//        print(nsArray)
//        print("다음 데이터를 세이브 하였음 \(self.rawArray)")
    }
    
    func saveToDoc2() {
        
        var tempArray: [[String: Any]] = [[:]]
        
        for i in rawArray {
            
            if i.userNumber == 0 {
                tempArray[0] = i.dictionary
            } else {
                tempArray.append(i.dictionary)
            }
        }
        
        let nsArray: NSArray = NSArray(array: tempArray)
        
        nsArray.write(toFile: docPath, atomically: true)
        
//        print(nsArray)
//        print("다음 데이터를 세이브 하였음 \(self.rawArray)")
    }
    
    func addUser(_ dict:User) {
        self.rawArray.append(dict)
    }
    
    func editUser() {
        self.rawArray[(user?.userNumber)!] = user!
    }
    
    func addEmotionData(_ dict:TimeLineEmotion) {
        user?.userData.insert(dict, at: 0)
        
    }
    
    func setUser() {
        
        let currentUser: String = UserDefaults.standard.object(forKey: "currentUser") as? String ?? ""
        
        for index in rawArray {
            if index.userId == currentUser {
                user = index
            }
        }
    }
    
    func logOut() {
        
        UserDefaults.standard.set(false, forKey: "logInStatus")
    }
    
    
}
