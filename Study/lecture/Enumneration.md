# Enumneration
- class, struct와 같은레벨
- 그룹에대한 값을 정의하고 사용
- 원시값으로 실제값을 부여할수있다.
- 어느 한 그룹에 연관된 값을 정의하는것


##**중요도**

- Enum을 그대로쓰는형태
- RowValue를 넣는거
- 튜플같은 형태를 통해 값을 집어넣는것(Associated)
- 함수
- Recursice(재귀) Enum


### 1. 문법
```swift
enum <열거형 이름> {case <열거 항목1> 
case <열거 항목2> 
case <열거 항목3>}

enum Planet {    case mercury, venus, earth,mars, jupiter, saturn,uranus, neptune
}

//둘다 똑같은 표현법임
```

### 2. 값 지정
```swift
var directionToHead = CompassPoint.westdirectionToHead = .north

//얘의 타입은 CompassPint타입
```

열거형안에 어떤 값이 들어있는게 아니라 항목들을 값이라고 치는거임. 항목을 정의하는애입니다.


### Switch문과 함께쓰면 좋다

```swift
switch directionToHead {    case .north:        print("Lots of planets have a north")    case .south:        print("Watch out for penguins")    case .east:        print("Where the sun rises")    case .west:}print("Where the skies are blue")
//스위치문엔 항상 디폴트가 있어야되는데
여기는 왜 없냐면 열거형은 항목의 갯수가 정해져있고, 케이스들이 그것에 다 만족한다면 디폴트를 적어주지않아도 된다.
```
- enum 은오류처리할때 쓰면 좋음

 예를들면 이넘 안에 오류메세지가 뜰수있는 상황을 적어놓고
 스위치문을 써서 오류상황마다 Switch문으로 알럿의 타이틀을 바꿔주면됨
 알럿의 타이틀에는 스위치문을 썼던 함수를 넣어주면 자동으로 바뀜(아래코드 참조)

```swift
enum AlertType{
    case LoginFail
    case Success
    case SignupFail
}

func showAlert(type:AlertType) {
    let aleart = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: . alert)
    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(action)
    self.present(alert, animated: true, comletion:nil)
}

func titleMsg(for type:AlertType) -> String {
    var title = ""
    switch type {
    case .LoginFail:
        title = "로그인을 실패 했습니다"
    case .SignupFail:
        title = "회원가입을 실패 했습니다"
    case .Success:
        title = "성공"
    }
    return title
}

//실행할 땐,
showAlert(type:.LoginFail)
```




### 3. Associated Values

### 4.Raw Values

```swift
enum Wearable {       enum Weight: Int {           case Light = 1       }       enum Armor: Int {           case Light = 2       }       case Helmet(weight: Weight, armor: Armor)       func attributes() -> (weight: Int, armor: Int) {           switch self {           case .Helmet(let w, let a):               return (weight: w.rawValue * 2,                        armor: a.rawValue * 4)} }   }   let woodenHelmetProps = Wearable.Helmet(weight: .Light, print (woodenHelmetProps)armor: .Light).attributes()
```



