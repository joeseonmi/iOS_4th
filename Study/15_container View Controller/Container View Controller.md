# Container View Controller- 뷰 컨트롤러의 컨테이너역할을 한다

### 1. NavigationController
- 뎁스를 통해서 들어가는 느낌
- 스택구조로 되어있다
- 구조
	- ViewControllers
	- navigation bar
	- tool bar
	- delegate

- 하나의 루트뷰를 설정해줘야만 화면에 보인다(뷰를 갖고있지않음)
- 스토리보드에서 연결해줄때 show로 연결해줘야됨, 모달로 띄울때는 네비게이션 모달로 띄워야댐
- 코드로 작성할때는 self의 네이게이션컨트롤러를 불러줘야댐 (push 넣는다 / pop 뺀다)



윈도우 탭바 네비게이션 커스텀뷰 순서로 쌓이는데 하위뷰에 상위뷰는 올릴수없다.
근데 이것들이 다 유아이컨트롤러라서 되긴되는데 UX적으로 이렇게 쓰면 안된다