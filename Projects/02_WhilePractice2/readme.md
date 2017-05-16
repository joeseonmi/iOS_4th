- while로 구구단 만들기

```swift     
 func playGugudan(dan:Int)
 {
      var gob:Int = 1
      while gob <= 9
      {
          print("\(dan) * \(gob) = \(dan * gob)")
          gob += 1
      }
 }
	       
 playGugudan(dan: 3)     
```

- for in 구구단 만들기

```swift
func platGugudanForin(dan:Int)
{
    var gob:Int = 1
    for gob in 1...9
    {
        print("\(dan) * \(gob) = \(dan * gob)")
    }
}
    
platGugudanForin(dan: 6)
```


- 중복 가능한 로또 만들기

```swift
func makeLottoNumber() -> [Int]
{
    var lottoNumbers:[Int] = []
    
    while lottoNumbers.count < 6 {
        let randomNum:UInt32 = arc4random_uniform(46)//->번호를 랜덤으로뽑아
        if randomNum != 0 {
            lottoNumbers.append(Int(randomNum))}//->lottoNumber배열에 넣어주세여
    }
    
    return lottoNumbers
    
}
    
print(makeLottoNumber())
```


- 중복 불가능한 로또 만들기

```swift
func makeLottoNumberNotRepeat() -> [Int]
{
    var notRepeatNumber:[Int] = []
    
    while notRepeatNumber.count < 6
    {
       let randomNum:UInt32 = arc4random_uniform(46)
        
        if randomNum != 0 && !notRepeatNumber.contains(Int(randomNum))
        {
            notRepeatNumber.append(Int(randomNum))
        }
    }
    
     return notRepeatNumber
}
    
print(makeLottoNumberNotRepeat())
```

- 약수구하기

```swift
func pickMeasure(valueNumber:Int) -> [Int]
{
    var measure:[Int] = []
    
    for index in 1...valueNumber
    {
        if valueNumber % index == 0
        {
            measure.append(index)
        }
    }
    return measure
}
    
print(pickMeasure(valueNumber: 12))
```


- 소수인지 아닌지 구하기

```swift
func isDecimal(number:Int) -> Bool
{
    var measure:[Int] = []
    
    for index in 1...number
    {
        if number % index == 0 {
            measure.append(index)
        }
    }
    
    if measure.count <= 2
    {
        print("소수")
        return true
    }
        
    print("소수가아니다")
    return false
}
    
    
isDecimal(number: 9)
```

- playground와 Xcode를 쓸때 차이점은  playground는 코드를 실시간으로 빌드해서 값을 출력해주지만 Xcode는 아님, Xcode에서 함수를 실행하려면 무언가에 의해서 함수가 호출되야 하는데 Xcode로 빌드할때 가장 먼저 호출되는 함수가 ViewdidLoad이기때문에 여기에다 함수를 호출해줘야 실행된다