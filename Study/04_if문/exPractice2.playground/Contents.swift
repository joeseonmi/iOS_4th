//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 점수에서 등급을 반환해주는함수 (score -> grade)

func getGrade(inScore score:UInt) -> String
{
    let getGrade:String = "F"
    if score <= 100
    {
        if score >= 95
        {
            print("A+")
        }
        else if score >= 90
        {
            print("A")
        }
        else if score >= 85
        {
            print("B+")
        }
        else if score >= 80
        {
            print("B")
        }
        else if score >= 75
        {
            print("C+")
        }
        else if score >= 70
        {
            print("C")
        }
    }
    return getGrade
    //일단 겟그레이드는 "F" 인데 각 조건들이 맞으면 그걸로 출력하고 정 없으면 "F" 출력한다는 의미인가
}

getGrade(inScore: 98)

// 그레이드를 포인트로 변환해주는 함수

func getPoint(inGrade grade:String) -> Double
{
    var getPoint:Double = 0.0
    
    if grade == "A+"
    {
        getPoint = 4.5
    }
    else if grade == "A"
    {
        getPoint = 4.0
    }
    else if grade == "B+"
    {
        getPoint = 3.5
    }
    else if grade == "B"
    {
        getPoint = 3.0
    }
    else if grade == "C+"
    {
        getPoint = 2.5
    }
    else if grade == "C"
    {
        getPoint = 2.0
    }
   
    return getPoint
}

getPoint(inGrade: "A+")
//이 함수를 만들때 걸렸던거 => 아까는 let으로 선언했는데 지금은 var로 선언해줌(겟포인트의 값이 계속 바뀌기때문)

//점수를 받아서 포인트로 반환하는 함수

func getPointFromScore(inScore score:Int) -> Double
{
    return getPoint(inGrade: getGrade(inScore: UInt(score)))
    //특히 마지막줄에 타입안쓰고 score괄호빼고 넣었는데 반환안되고, 괄호넣고 타입넣으니까 되는데 이유가뭐지
}


getPointFromScore(inScore: 95)

//리턴값넣는거 어려워따 함수를 이해못한건지 변수를 이해못한건지도 모르겠다씌바

