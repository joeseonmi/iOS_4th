//
//  ViewController.swift
//  BaseballGame
//
//  Created by joe on 2017. 5. 23..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     
     1. 랜덤숫자가 생성된다(생성만)
     2. 사용자가 숫자를 누른다 -> 각 레이블에 하나씩 표기됨
     3. Go버튼 누르면 게임 플레이된다.
     
     */
    var corectAnswerArray:[UInt] = []
    var userAnswerArray:[UInt] = []

    
    ///////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //랜덤으로 뽑힌 숫자가 정답어레이에 들어간다 어레이에 3개가있으면 빠져나옴
        makeRandomNumber()
        print(corectAnswerArray)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///////////////////////////////////////////////
    
    
    @IBOutlet weak var firstAnswer: UILabel!
    @IBOutlet weak var secondAnswer: UILabel!
    @IBOutlet weak var thirdAnswer: UILabel!
    
    
    @IBOutlet weak var giveupLabel: UILabel!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func clickNumber(_ sender: UIButton) {
        if !self.giveupLabel.text!.isEmpty {
            self.giveupLabel.text = ""
        }
        
        //숫자버튼 누르면 순서대로 유저엔써 레이블에 숫자가 들어간다.
        //유저엔써 어레이에 숫자가 추가된다
        if userAnswerArray.count == 0 {
            self.firstAnswer.text = String(sender.tag)
            userAnswerArray.append(UInt(sender.tag))
        }else if userAnswerArray.count == 1 {
            self.secondAnswer.text = String(sender.tag)
            userAnswerArray.append(UInt(sender.tag))
            
        }else if userAnswerArray.count == 2 {
            self.thirdAnswer.text = String(sender.tag)
            userAnswerArray.append(UInt(sender.tag))
        }
        
        print(userAnswerArray)
    }
    
    //랜덤숫자 만들어주는거
    func makeRandomNumber() {
        while corectAnswerArray.count < 3 {
            let randomNum:UInt32 = arc4random_uniform(9)
            if !(corectAnswerArray.contains(UInt(randomNum))) && randomNum != 0
            {
                 corectAnswerArray.append(UInt(randomNum))
            }
        }
    }
    
    func matchNumber() -> (strikeCount:Int, ballCount:Int, outCount:Int){
        //유저엔써에 카운트가 3이 맞는지 확인하고 돈다
        //버튼을 누르면 각 숫자 맞춰보고 디스플레이라벨에 힌트표시
        //숫자가 맞으면 리셋으로 변경
        //유저가 쓴번호랑 랜덤으로 뽑은 번호가 맞는지
        
        //에러찾기
        //
        
        var strikeCount:Int = 0
        var ballCount:Int = 0
        var outCount:Int = 0
        
        if userAnswerArray.count == 3 {
            for i in 0...2
            {
                let userAnswerNumber = userAnswerArray[i]
                if corectAnswerArray.contains(userAnswerNumber){
                    if corectAnswerArray[i] == userAnswerArray[i]{
                        strikeCount += 1
                    }else{
                        ballCount += 1
                    }
                }else{
                    outCount += 1
                }
            }
        }
        return (strikeCount:strikeCount, ballCount:ballCount, outCount:outCount)
    }
    
    @IBAction func giveupBtn(_ sender: UIButton) {

        self.giveupLabel.text = String("정답은 \(corectAnswerArray[0]),\(corectAnswerArray[1]),\(corectAnswerArray[2])")
        
        resetGame()
        print(corectAnswerArray)
        self.displayLabel.text = "다시 시작! 숫자를 입력하세요!"
        
    ////한번썼던 레이블을 비우고 다시쓰고싶은데
    }
    //리셋
    func resetGame(){
        //여긴 코렉트 엔써어레이까지 비워줘야댐
        challengeCount = 0
        userAnswerArray = []
        self.firstAnswer.text = ""
        self.secondAnswer.text = ""
        self.thirdAnswer.text = ""
        corectAnswerArray = []
        makeRandomNumber()
    }

    
    var challengeCount:Int = 0
    
    @IBAction func playGameBtn(_ sender: UIButton) {
        //유저엔써에 카운트가 3이 맞는지 확인하고 돈다
        //버튼을 누르면 각 숫자 맞춰보고 디스플레이라벨에 힌트표시
        //숫자가 맞으면 리셋으로 변경
        let resault:(strikeCount:Int, ballCount:Int, outCount:Int) = matchNumber()
        
        challengeCount += 1
        
        self.displayLabel.text = "\(challengeCount)번 째 도전! \nStrike: \(resault.strikeCount)  |  Ball: \(resault.ballCount)  |  Out: \(resault.outCount)"
        
        
/////////////   //숫자라벨들이 채워지지않으면 숫자 채우라고 알려준다
        if !(self.firstAnswer.text?.isEmpty)! && !(self.secondAnswer.text?.isEmpty)! && !(self.thirdAnswer.text?.isEmpty)! {
            //////////////    //스트라이크가 3이면 끝난다
            if resault.strikeCount == 3 {
                self.displayLabel.text = "\(challengeCount)번 만에 정답! \n🤡  🤡  🤡  🤡  🤡  🤡  🤡"
                resetGame()
                print(corectAnswerArray)
            }else{
                userAnswerArray = []
                self.firstAnswer.text = ""
                self.secondAnswer.text = ""
                self.thirdAnswer.text = ""
                //이건 유저엔써어레이비우고 라벨들 숫자 없애주는거
            }
        }else{
            self.displayLabel.text = "숫자를 채워주세요."
        }
        
    }

}

