//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//짝수를 구하는 함수
//2로 나눴을때 나머지가 없으면 짝수
func isEven(number num:Int) -> Bool
{
    if (num % 2) == 0 {
        return true
    }
    else
    {
        return false
    }
}

//else 를 쓰지않고 밖에 return false 를 적어주면 if가 만족되면 반환되고
//if가 만족안했을시 다음 구문으로 읽혀서 false 반환됨

/*{
    if (num % 2) == 0 {
    return true
    }
    return false
 }
 */
//위에꺼 처럼 작성해도 가능



let evenNumber:Bool = isEven(number: 3442)
print(evenNumber)

let p:(height:Double,weight:Double,money:Int) = (180.0, 70.4, 1000)

func isAbleMeetting(person: (height:Double,weight:Double,money:Int)) -> Bool
    //아규먼트네임(인수명)을 안쓰면 파라미터이름(매개변수)를 가져와서 쓰게된다
    //func isAbleMeetting(person:(height:Double,weight:Double,money:Int)) -> Bool
    //라고 썼으면 인수명을 안쓰고 파라미터만쓴거고, 파라미터를 튜플로적은것
{
    if person.height >= 170 && person.weight <= 70 && person.money >= 2000
    {
        print("무조건소개")
        return true
        
    }else if (person.height >= 170 && person.weight <= 70) || person.money >= 2000
    {
        print("소개팅가능")
        return true
        
    }else if (person.height >= 170 || person.weight <= 70) || person.money >= 2000
    {
        print("받아는봄")
        return true
        
    }else
    {
        print("노노")
        return false
    }
    
}

isAbleMeetting(person: p)



//두 수의 값을 스위치
func swapToInt(_ num1:inout Int, _ num2:inout Int)
{
    let temp:Int = num1
    num1 = num2
    num2 = temp
}

//앞에수에서 뒤에수를 빼는 함수
//뒤에수가 크다면 swapToInt함수를 사용해서 같은 값을 스위치시킨다.
func minus(firstNum num1:Int, secondNum num2:Int) -> Int
{
    var vNum1 = num1
    var vNum2 = num2
    
    if vNum2 > vNum1 {
        swapToInt(&vNum1,&vNum2)
    }
    
    return vNum1 - vNum2
    
}


print(minus(firstNum: 6, secondNum: 8))

