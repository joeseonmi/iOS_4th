# plist data 저장
- plist
- notification
- setting
- singleton, enum사용하보기

## Plist
- 인포메이션이 담긴 파일, key . type . value로 이루어진 딕셔너리 타입
- 데이터구조를 파일로 보여주는거
- iOS App에 Plist를 만들고 거기있는 값을 읽어오고 저장하는일을 힌다.
- 가장 심플한 저장방법
- file형태로 저장되서 외부에서 Access가능(보안취약)

### 1. 파일 위치
- Bundle & Documents 폴더
- Bundle은 프로젝트에 추가된 Resorce가 모인곳
- Documents는 엑스코드에서 확인할 수 없다. 앱을 설치해서 실행해야만 만들어진다. 실질적으로 접근 할 수 없다.
- 앱을 처음에 깔때 앱의 용량에 해당되는 것들은 Bundle에 있다.
- Bundle은 처음 프로그램을 셋팅할때 내가 넣는 이미지들이 모여있다. 러닝중에는 Documents에 저장된다. 앱을 사용하면서 앱 용량이 느는 것들은 Documents에 있다.
- **즉! plist파일의 데이터만 불러오는 역할은 Bundle을 통해서, plist파일에 데이터를 쓰고 불러오는 역할은 Documents폴더 에 저장된 파일로!**
- Plist파일을 만드는 방법은 2가지가 있다. 어려운방법은 XML코드로 만드는 것이고, 쉬운방법은 엑스코드에서 NewFile로 PropertyListFile을 만들어 주는것이다.
- Bundle에 있는 데이터는 쓰기가 안된다.(누구에게나 똑같이 주어지는 기본 데이터) 읽기전용이면 Bundle에 넣고 읽고쓰고를 다 할거면 Documents다.
- Bundle에 만들고 그걸 Documents에 복사하면 쉽다.

#### Bundle
> 실행코드, 이미지, 사운드, nib 파일, 프레임 워크,설정파일 등코드와 리소스가 모여있는 file system내의 Directory
>
> - 프로젝트에는 들어가있으나 번들에 들어가있지않으면 로드되지않는다. 확인해줘야함. 요즘에는 그런경우 거의 없다함
 
- Bundle을가져오려면 인스턴스를 해줘야한다.

```swift
 let mainBundle = Bundle.main
 //singleton	
 let filePath = mainBundle.path(forResource: "rName", ofType:"rType")
//내가 말하는 리소스의 파일경로를 달라
``` 
 
#### Bundle 데이터 불러오기
- Path를 가지고 인스턴스를 만들어야됨 path는 실질적으로 데이터의 위치를 알려주는것. 
- 데이터를 가져와서 인스턴스 되야 내가 사용할 수 있다.
- filePath가 실제로 존재하는지 옵셔널을 통해 확인해야한다.

```swift
if let path = filePaht {     let image = UIImage(contentsOfFile: path)}
```

- contentsOfFile이 모든것에 존재하지는 않는다. 예를들면 Array, dictionary에 존재하지않는다. 그래서 불러오기 쉽지않음


**어떻게 불러와야되나?**

```swift
if let filePaht = mainBundle.path(forResource: "rName", ofType: "rType"),   let dict = NSDictionary(contentsOfFile: filePaht) as? [String: AnyObject]{}
```

- NSDictionary(클래스(그냥 딕셔너리는 Struct 스위프트에서 데이터는 struct로 만들기로함))로 불러와서 String:AnyObject타입의 딕셔너리로 다운캐스팅 해준거.

#### Documents 데이터 불러오기
1. Document folder Path 찾기
2. Document folder에 plist 파일이 있는지 확인 -> 만약 없다면 : bundle에 있는 파일 Document에 복사
3. Path를 통해 객체로 변환, 데이터 불러오기
4. writeToFile 메소드로 파일 저장

**파일불러오기**

```swift
let path:[String] =NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)let basePath = path[0] + "/fileName.plist"
```

- Documents폴더 위치까지를 불러온다.(1~2번과정)

```swift
if !FileManager.default.fileExists(atPath: basePath) //싱글턴, fileExists에 basePath에 파일이 존재하는가?, 존재하지 않는 경우에 안의 코드가 실행된다. 없으면, Bundle에 있는걸 Documents에 복사 {

 if let fileUrl = Bundle.main.path(forResource: "fileName", ofType: "plist"){    do {         try FileManager.default.copyItem(atPath: fileUrl, toPath: basePath) 
         //Bundle에있는거를 Doucument	로 카피    } catch  {         print("fail")} 
}//bundle에 있는 파일 Document에 복사

}
```

- Dictionary 인스턴스 불러오기

```swift
if let dict = NSDictionary(contentsOfFile: basePath) as? [String: AnyObject]{   // use swift dictionary as normal}
```

- write(toFile)메소드를 통해 파일 저장

```swift
if let dict = NSDictionary(contentsOfFile: basePath) as? [String: Any]{ var loadData = dictloadData.updateValue("addData", forKey: "key")let nsDic:NSDictionary =  NSDictionary(dictionary: loadData)nsDic.write(toFile: basePath, atomically: true)}
```

> 근데 데이터를 사용할때마다 이렇게 쓰기 힘드니까 singleton을 만든다.


