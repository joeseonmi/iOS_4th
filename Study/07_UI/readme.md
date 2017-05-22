## UIView Class	- open func addSubview(_ view: UIView)- open func insertSubview(_ view: UIView, at index: Int)- open func removeFromSuperview()- open func layoutIfNeeded()

> 뷰 컨트롤러에서 버튼이나 레이블 끌어다 놨을때 뷰에 계층구조가 생긴거, 드래그할때 파란영역이 생기는데 그게 거기에 계층구조가 생겼다는 뜻임. 뷰 하이라키에서 아래로 내려갈수록 위에 있다고 보면됨(쌓은순서인듯) 커맨드 누르고 드래그하면 계층으로 안들어감
> 

- ViewdidLoad는 View가 불린다음에 들어옴.
	1. 변수선언 - UIView만듬
	2. 속성만들어주기
	3. 뷰에 추가


## UILabel Font
- 디자이너가 원하는 폰트사이즈랑 맞추기힘듬 나중에 디자이너가 원하는 시안을 밑에 깔아놓고 폰트사이즈작업하면 됨니다
- font size나, 정렬같은 이슈들이 있다.


## UIImageView
- 이미지데이터를 화면에 보여주는거
- 레이블은 텍스트 이미지뷰는 이미지를 보여주는거(이미지객체, 이미지인스턴스)
- 이미지의 위치를 지정해줘야됨
- 컨텐츠모드: 내가만든 이미지뷰 안에 꽉찰것인지, 비율을 고정시킬것인지 머 그런이슈들

## Asset Catalogs
- 리소스관리를 하기위함 (각 디바이스 대응용, 리소스매칭)
