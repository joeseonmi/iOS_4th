//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//절대값 프린트.

func makeAbsolut(someNum num:Int) -> Int
{   var makeAbsolut:Int = num

    if makeAbsolut < 0
    {
        makeAbsolut *= -1
    }
    
    return makeAbsolut
}

makeAbsolut(someNum: -5)



//홀짝 프린트 함수(홀수 인지 짝수인지 확인)


func oddEven(someNum num:Int) -> Bool
{
    let result:Bool = false
    
    if num % 2 == 0
    {
        print("짝수")
    }else{
        print("홀수")
    }
    
    return result
}

oddEven(someNum: 3)



//영화표값 계산하기.
//기본가격 :        9000원
//10시까지 조조 :   -10%
//청소년 :         -10%
//argument : 영화시간(24시간제), 성인인원, 청소년인원.

func totalPrice(mTime time:Int, adult aCount:Int, teenager tCount:Int) -> Int
{
    var result:Int
    
    let tDisPrice:Int = 9000 * 90 / 100
    let aEarlyDisCount:Int = 9000 * 90 / 100
   
    if time <= 10
    {
        result = (aEarlyDisCount * aCount) + (tDisPrice * tCount)
    }else
    {
        result = (9000 * aCount) + (tDisPrice * tCount)
    }
    
    return result
}

print("영화값은 \(totalPrice(mTime: 11, adult: 2, teenager: 2))원")




//지폐별 갯수
//금액을 입력받고 100원, 500원, 1,000원, 5,000원, 10,000원, 50,000원권으로 각각 몇 장씩 나눠지는지 프린트.














//윤년구하기
//서력 기원 연수가 4로 나누어떨어지는 해는 윤년으로 한다.(2004년, 2008년, 2012년, 2016년, 2020년, 2024년 …)
//이 중에서 100으로 나누어떨어지는 해는 평년으로 한다.(1900년, 2100년, 2200년, 2300년, 2500년 …)
//그중에 400으로 나누어떨어지는 해는 윤년으로 둔다.(1600년, 2000년, 2400년 …)

//연도를 입력받고 윤년인지 평년인지 프린트.


func getLeapYear(leapYear year:Int) -> Bool
{
    let result:Bool = false
    
    if ( year % 4 == 0 ) || ( year % 100 == 0 && year % 400 == 0 )
    {
        print("윤년")
        return true
    }
    
    print("평년")
    return result
}

getLeapYear(leapYear: 2020)











