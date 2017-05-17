# 클래스 & 객체
> 클래스는 (속성+행동),(변수+함수) 로 이루어져있다.
- 클래스 이름은 대문자로 시작한다

```swift
class ClassName{

	}	
```

### 프로퍼티
- 클래스에서 쓰이는 **변수**를 **프로퍼티**라고 부른다
- 클래스에서 쓰이는 **함수**는 **메서드**라고 부른다
- 함수나 구문안에서 쓰이는 변수는 그냥 변수라고 부름😐

```swift
class ClassName{

	var property:propertyType = "value"
	var property2:propertyType = "value2"
	
	}
```

- 인스턴스(메모리에할당) -> 객체
- 변수로 클래스를 선언할때 **클래스이름**이 타입이된다.

```swift
var varName:ClassName = ClassName()
```

-

### init⁉️
> 속성을 초기와하는 함수
> 
> init에 **parameter**를 추가해서 커스텀 할 수 있다
> 

```swift
class ClassName {

	var propertyA:propertyType = "valueA"
	var propertyB:propertyType = "valueB"
	var propertyC:propertyType = "valueC"
	
	init(propertyA:type, propertyB:type)
	{
		self.propertyA = propertyA
		self.propertyB = propertyB
	}	
}
```
- init에 parameter를 추가
- self는 자기자신의 인스턴스를 가리킨다

-

# 학생점수평균 계산하는 계산기😣
> 흐름
> 
>- 1. 클래스는 Subject / Students / ScoreManager
>- 2. Subject의 프로퍼티는 과목이름 / 점수
>- 3. Students의 프로퍼티는 학생이름 / 과목들 / 평균점수
>- 4. ScoreManager에는 평균을 계산하는 함수
>

- 1. 클래스 만들기
- 2. Subject 클래스

```swift
class Subject {
    
    var name:String
    var score:Int
    //밑에서 이닛으로 선언될꺼라서 옵셔널같은거 안붙임
    
    init(name:String, score:Int){
        self.name = name
        self.score = score
    } 
}
```
> 프로퍼티를 name과 score정하고 init으로 둘다 속성을 초기화 해줌
 

- 3. Sudent 클래스

```swift
class Student {
    
    var name:String
    var subjects:[Subject]?
    var averageScore:Double?
    
    init(name:String) {
        self.name = name
    }
    

    func add(subjectName:String, score:Int)
    {
        if subjects == nil {
            subjects = []
        }
        let sj:Subject = Subject(name: subjectName, score: score)
        subjects?.append(sj)
    }
}
```

> name만 init으로 설정초기화.
> add라는 함수를 설정했는데
>
> 내용은 subjects라는 배열이 nill상태면 빈 배열을 하나 만들어준다 / sj라는 이름의 Subject 클래스를타입으로 갖는 변수선언 = Subject의 parameter는 아까 2에서 설정했던 name 과, score 임다.
> 
> sj 변수의 parameter값에 방금선언한 함수의 인수명들을 넣는다.
>
> -> subject배열에 추가한다 (sj)를.
> 

- 4. ScoreManager 클래스

```swift
class ScoreManager {
    
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
            if let subjects = student.subjects {
           
            var total:Int = 0
            for subject in subjects {
                
                    total += subject.score
           
            }
                
            returnAverage = Double(total) / Double(subjects.count)
        }
 
            return returnAverage
    }
}
```

> ??????????????


- 5. ViewController 에서 실행해보기

```swift
let s1:Student = Student(name: "joe")
s1.add(subjectName: "수학", score: 90)
s1.add(subjectName: "국어", score: 80)
s1.add(subjectName: "영어", score: 79)
s1.add(subjectName: "과학", score: 95)
    
let manager:ScoreManager = ScoreManager()
let s1Average = manager.average(forStudent: s1)
    
    
print(s1Average)        
```




