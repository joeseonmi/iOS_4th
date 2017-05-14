//: Playground - noun: a place where people can play

import UIKit

//1. inch to cm, cm to inch (2개)

func changeInchToCm(inputInch inch:Int) -> Double
{
    let result:Double = Double(inch) * 2.54
    return result
}

func changeCmToInch(inputCm cm:Double) -> Double
{
    let result:Double = cm / 2.54
    return result
}



//2. m2 to 평, 평 to  m2 (2개)
//1m2=0.3025평

func changeM2ToPyeng(inputM2 m2:Double) -> Double
{
    let result:Double = m2 * 0.3025
    return result
}

func changePyengToM2(inPyeng Pyeng:Double) -> Double
{
    let result:Double = Pyeng / 0.3025
    return result
}




//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
//섭씨 1도 는 화씨 33.8

func cngFahrenToCentigrade(inputFahren fahren:Double) -> Double
{
    let result:Double = Double( fahren - 32 ) / 1.8
    return result
}


func cngCentigradeToFahren(inputCentigrade centigrade:Double) -> Double
{
    let result:Double = centigrade * 1.8 + Double(32)
    return result
}


//4. 데이터량 (KB to MB, MB to GB) (2개)

func cngKbtoMb(inputKb kb:Double)->Double
{
    
    let result:Double = kb * 0.000977
    return result
    
}

func cngMbtoGb(inputMb mb:Double)->Double
{
    
    let result:Double = mb * 0.000977
    return result
    
}


//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 11320 >> 4400초








