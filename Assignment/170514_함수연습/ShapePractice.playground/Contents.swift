//: Playground - noun: a place where people can play

import UIKit

//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).

func getRegularSqure(regularSqure length:Int) -> Int
{
    let result:Int = length * length
    //왜 var로 선언하지않고 let으로 선언되는지 모르겠다
    return result
}

print("정사각형의 넓이는 \(getRegularSqure(regularSqure: 6))이다")


//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)


func getCircle(thecircle radius:Int) -> Double
{
    let result:Double = Double(radius) * Double(radius) * 3.14
    return result
}
print("원의 넓이는 \(getCircle(thecircle: 5))이다")



//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)

func getTriangl(theTriangle:(base:Int, height:Int)) -> Int
{
    let result:Int = (theTriangle.base * theTriangle.height) / 2
    return result
}
print("삼각형의 넓이는 \(getTriangl(theTriangle: (base: 5, height: 10)))이다")




//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)
//(사다리꼴의 넓이) = {(아랫변) ＋ (윗변)} × (높이) ÷ 2

func getTrapezoid(trapezoid:(base:Int, top:Int, height:Int)) -> Double
{
    let result:Double = Double(trapezoid.base + trapezoid.top) * Double(trapezoid.height) / Double(2)
    return result
}
print("사다리꼴의 넓이는 \(getTrapezoid(trapezoid: (base: 5, top: 10, height: 3)))이다")



//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)

func getBulkCube(bulkcube length:Int) -> Int
{
    let result:Int = length * length * length
    return result
}
print("정육면체 부피는 \(getBulkCube(bulkcube: 5))이다")



//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
//반지름 * 반지름* 3.14 * 높이

func getBulkCylinder(theCylinder:(radius:Int, height:Int)) -> Double
{
    let result:Double = Double(theCylinder.radius * theCylinder.radius * theCylinder.height) * 3.14
    return result
}

print("원기둥의 부피는 \(getBulkCylinder(theCylinder: (radius: 2, height: 10)))이다")




//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)

func getBulkSphere(theSphere radius:Int) -> Double
{
    let result:Double = Double(4/3 * radius * radius * radius) * 3.14
    return result
}

print("구의 부피는 \(getBulkSphere(theSphere: 2))이다")



//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
//반지름 x 반지름 x π(3.14) x 높이 x 1/3

func getBulkCone(cone:(radius:Int, height:Int)) -> Double
{
    let result:Double = Double(cone.radius * cone.radius * cone.height * 1/3) * 3.14
    return result
}

print("원뿔의 부피는 \(getBulkCone(cone: (radius: 3, height: 2)))이다")








