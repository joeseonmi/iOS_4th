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


//점수를 받아서 포인트로 반환하는 함수

func getPointFromScore(inScore score:Int) -> Double
{
    return getPoint(inGrade: getGrade(inScore: UInt(score)))
}


getPointFromScore(inScore: 95)



