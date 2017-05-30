# UserDefault

> 이제까지 프로그램에대한 기초를 배움. 이제까지 안배운 내용은 데이터의 저장에 대한 내용, 유저디폴트는 데이터를 영구적으로 저장하는데 있어서 가장 심플한 방법이다. 활용도가 큽니다.


## 🤖 데이터 저장방법
- 파일저장
	- Property List
	- SQLite(iOS에서는 바로쓰진않고 코어데이터를이용, 문법이따로있다.)
	- 아카이빙(인스턴스를 데이터형태로 압축)
- iOS데이터베이스이용 (내부적으로 큰 데이터를써야된다 할때 씀)
- 네트워크서버이용(제일많이쓰임)
- 스위프트나, 모바일에서는 REALM을 많이씀


## UserDefault 는?
- Property List 에 저장하는 가장 간단한 방법
- 사용자의 정보를 저장하는 싱글톤 인스턴스(싱글톤 : 전체프로그램 내에서 하나의 인스턴스만 존재하는 것)
- 간단한 사용자 정보를 저장/불러오기 위해 만든 인스턴스(**유저 정보저장**)
- 내부적으로 Plist로 저장되있어 **보안이 강하지않다** (파일로 저장하는것이기때문에 내가 원하면 그 파일을 볼 수 있다.)


```swift  open class var
standard: UserDefaults { get }//데이터 불러오기open func object(forKey defaultName: String) -> Any? open func string(forKey defaultName: String) -> String? open func array(forKey defaultName: String) -> [Any]?//데이터 저장하기open func set(_ value: Any?, forKey defaultName: String)//데이터 지우기open func removeObject(forKey defaultName: String)
```

- 클래스고, 스탠다드를 통해 바로 접근한다
- 딕셔너리 형태로 저장한다( 키값을 이용해서 정보를 불러옴 )
- 정확하게는 Json타입이라고함 
	- Json이뭐임 (key벨류로 이루어진 형태)
- key값은 통일시켜야함

- 저장된 정보 파일은 지우려면 앱을 아예 삭제한다
- remove는 파일 안의 항목을 지워주는거 
- 저장한 해당 코드를 지워도 데이터는 남아있다.
