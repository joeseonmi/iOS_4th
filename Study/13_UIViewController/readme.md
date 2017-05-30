# UIViewController
- 뷰랑 동급인 다른 인스턴스
- 대부분의 앱은 여러개의 뷰컨트롤러로 이루어져있다.
- 컨트롤러는 사용자의 인터랙션(이벤트)에 해당하는 행동을 데이터에서 가져와서 사용
- 컨트롤러가 뷰를 관리한다, 뷰 컨트롤러간의 전환등을한다
- 무조건 하나의 루트뷰를 가지고있다. 우리가 알고있는 모든 UI는 View이다.

## 특징
#### 1. Child UIViewController

- 다른 컨트롤러를 자식으로 여겨 컨트롤할 수 있다.
- Sprit View controller가 있음 자식 ViewController들이 container에 addSubView가 되서 보여진다

#### 2. UserInteraction

- 이벤트를 받아서 해당되는 이벤트를 각각의 뷰로 처리시켜준다

#### 3. Data Marshaling(중계자)

- 데이터와 뷰간의 중계자역할

#### 4. Resource Management

- 메모리가 부족시 didReceiveMemoryWarning() 메소드가 자동 으로 불리며, 오래동안 사용하지 않은 객체와 다시 쉽게 만들수 있는 객체를 제거할수 있어 메모리를 효율적으로 관리한다.

## 종류
#### 🎃 General View Controller
- 일반적인 ViewController로 각 ViewController가 Root View를 가지고있다.

- UIViewController Instance Load
	- 객체클래스를 이니셜라이즈해서 인스턴스 하는데 처음 뷰 컨트롤러를 시작할때는 스토리보드를 통해 가져옴. 내가 특정 뷰를 가져와야된다면 스토리보드를 통해서 뷰컨트롤러의 인스턴스를 가져와서 불러야한다.
![img](https://github.com/joeseonmi/iOS_4th/blob/master/Study/13_UIViewController/001.png)
	
	- 인스턴스를 만들때 이런식으로
	![img2](https://github.com/joeseonmi/iOS_4th/blob/master/Study/13_UIViewController/002.png)
	
#### 🎃 Present Modally(화면 전환)

- 뷰컨트롤러와 뷰컨트롤러간의 이동(뷰컨트롤러가 바꼈다는건 이벤트핸들링의 주체가 바꼈다는말임)

###### Segue

- 인스턴스임
- 앱의 인터페이스 흐름을 정의하는 데 사용
- 화면학고 화면 사이의 화살표
- ![img03](https://github.com/joeseonmi/iOS_4th/blob/master/Study/13_UIViewController/003.png)

**shuldPerformSegueWithIdentifier: sender** -> 세그가 어떤 조건의 결과에따라 다른 뷰컨트롤러로 가야할때 if문을 여기다가 넣어준다(**이 세그에 진입할것인지말것인지**)
- **prepareForSegue** 이 세그에 **진입했을때 줘야할 데이터가 있는지**(로그인할때 로그인하는사람에대한 정보같은거)

- 위의 함수들을 쓰는 타이밍
	![img4](https://github.com/joeseonmi/iOS_4th/blob/master/Study/13_UIViewController/004.png)

###### Unwind Segue

- 돌아가야되는 ViewController에 넣어줘야댐

```@IBAction func myUnwindAction(unwindSegue:UIStoryboardSegue)```

- 넣고 출발할 뷰 컨트롤러에서 버튼 -> 드래그 Exit 해서 돌아갈 뷰가있는 함수이름을 선택해 줘야댐









