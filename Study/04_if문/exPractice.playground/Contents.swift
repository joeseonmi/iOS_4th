//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func swapTwoInt(_ num1:inout Int, _ num2:inout Int)
{
    let temp:Int = num1
    num1 = num2
    num2 = temp
}

func minus(firstNum num1:Int, secondNum num2:Int) -> Int
{
    var vNum1 = num1
    var vNum2 = num2
    
    if vNum2 > vNum1 {
        swapTwoInt(&vNum1, &vNum2)
    }
    
    return vNum1 - vNum2
}


minus(firstNum: 5, secondNum: 10)

//짝수를 구하는 함수


func isEven(isNum num:Int) -> Bool
{
    
    if num%2 == 0 {
        return true
    }else{
        return false
    }
}



//예쁜 고양이거르는 함수
//고양이는 키 / 몸무게 / 나이
//키 35, 몸무게 5, 나이 2

var c:(height:Int, weight:Int, age:Int) = (22, 6, 5)

func beautyCat(cat:(height:Int, weight:Int, age:Int)) -> Bool
{
    if cat.age > 0 && cat.weight > 2
    {
        if cat.height >= 35 && cat.weight <= 5 && cat.age >= 2
        {
                print("예쁜고양이")
                return true
        }
        else if
            cat.height >= 35 && cat.weight <= 5 || cat.age >= 2
        {
                print("그냥고양이")
                return true
        }
        else if
            cat.height >= 35 || cat.weight <= 5 || cat.age >= 2
        {
                print("고양이")
                return true
        }
    }

    print("고양")
    return false

}

beautyCat(cat: c)