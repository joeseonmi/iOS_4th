//
//  ViewController.swift
//  HackerTonePractice
//
//  Created by 김태형 on 2017. 7. 6..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    
    var data:User?
//    let userArray = DataCenter.standard.rawArray

    let dateFormmater = DateFormatter()
    let date = Date()
    let calender = Calendar.current
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "logInStatus") {
            let logInVC: LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            self.present(logInVC, animated: true, completion: nil)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        
//        let userData = data?.userData
//        
//        // 최초 다이어리 작성 요일과 현재 요일 같은지 확인하는 곳
//        
//        let veryFirstUserEmotion = userData?.last // save에서 insert(Int: 0)으로 앞으로 save하기 때문에 last가 최초 작성일
//        let veryFirstUserDate = veryFirstUserEmotion?.date
//        let userDate = dateFormmater.date(from: veryFirstUserDate!)
//        if calender.component(.weekday, from: date) == calender.component(.weekday, from: userDate!) && sevenDayKey == false{
//            insertSevenDaysEmotion()
//            
//            sevenDayKey = true
//            
//        }else if calender.component(.weekday, from: date) != calender.component(.weekday, from: userDate!)
//        {
//            sevenDayKey = false
//        }
//        
        DataCenter.standard.setUser()
        loadData()
        
        tableView.separatorColor = UIColor.clear
        tableView.backgroundView = UIImageView(image: UIImage(named: "sam-ferrara-270946"))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data?.userData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! mainCustomCell
        
        cell.emotionImageView?.image = UIImage(named: (data?.userData[indexPath.row].emotion.rawValue)!)
        cell.userNameLabel.text = data?.userId
        cell.userTodayEmotion.text = convertText(to: (data?.userData[indexPath.row].emotion)!)
        cell.userComment.text = data?.userData[indexPath.row].comment
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }

    func loadData() {
        data = DataCenter.standard.user
    }
    
    func insertSevenDaysEmotion()
    {
        dateFormmater.dateFormat = "yyy MM dd"
        
        let timeLineEmotionArray = data?.userData
        
        let veryFirstUserEmotion = timeLineEmotionArray?.last
        
        let veryFirstUserDate = veryFirstUserEmotion?.date
        let userDate = dateFormmater.date(from: veryFirstUserDate!)
        var emotionArray:[Emotion] = []
        
        let days = getDaysArray(start: veryFirstUserDate!, max: getIntervalDays(date: date, anotherDay: userDate))
        
        for timeLineEmotion in timeLineEmotionArray!
        {
            if days.contains(timeLineEmotion.date)
            {
                emotionArray.append(timeLineEmotion.emotion)
            }
        }
        let realEmotion = emotion(from: emotionArray)
    }
    
    func getDaysArray(start: String, max:Int) -> [String] {
        
        var result: [String] = []
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale
        formatter.dateFormat = "yyyy MM dd"
        
        let today = formatter.string(from: Date())
        let startDay = formatter.date(from: start)!
        
        var components = DateComponents()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        for i in 0 ..< max {
            components.setValue(i, for: Calendar.Component.day)
            let week = calendar.date(byAdding: components, to: startDay)!
            let weekStr = formatter.string(from: week)
            if weekStr > today {
                break
            } else {
                result.append(weekStr)
            }
        }
        var realResult:[String] = []
        for _ in 1...7
        {
            realResult.append(result.last!)
            result.removeLast()
            
        }
        
        return realResult
    }
    func getIntervalDays(date: Date?, anotherDay: Date? = nil) -> Int {
        
        var interval: Double!
        
        if anotherDay == nil {
            interval = date?.timeIntervalSinceNow
        } else {
            interval = date?.timeIntervalSince(anotherDay!)
        }
        
        let r = interval / 86400
        
        return Int(floor(r))
    }

    
    func convertText(to rawValue:Emotion) -> String {
        switch rawValue {
        case .joy:
            return "기뻐요 :)"
        case .anger:
            return "짜증나요 :("
        case .breathigh:
            return "두근두근해요 :)"
        case .displeasure:
            return "우울해요 :("
        case .glad:
            return "신나요 :)"
        case .happy:
            return "행복해요 :)"
        case .melancholy:
            return "화나요 :("
        case .sad:
            return "슬퍼요 :("
        }
    }

}

