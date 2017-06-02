
세그 없애기(코드로구현)

스토리보드 아이디를 지정해준다

- 세그 : 다음 인스턴스를만들고 그 인스턴스로 이동시켜줌

- 스토리보드 인스턴스 생성
![image](/Users/joe/Desktop/스크린샷 2017-06-01 오후 2.11.54.png)

이거를 코드 한줄로 끝낼 수 있정

```swift
let storyboard:가려는 뷰컨트롤러 = self.storyboard?.instantiateViewController(withIdentifier: "이동하려는 뷰 컨트롤러 ID") as! 가려는 뷰컨트롤러(로 다운캐스팅)

여기까지가 인스턴스생성해준거
이거 이동시킬라면

self.present(아까만든 변수이름, animated:true, completion:nil)

하면 이동시켜준다
```


