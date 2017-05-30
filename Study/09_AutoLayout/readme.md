# AutoLayout
- 레이아웃을 자동으로 잡아준다


### Frame-Based Layout
- 모든화면은 포인트로 이루어져있다.
- 위치가 정해져있다보니, 화면사이즈가 커졌을때 일일히 대응해줘야하는 문제점이있다.
- 그래서 나온게 Auto Layout

### Auto Layout
- 제약을 설정해서 뷰를 표현한다
- 제약 제한사항이있음

- StackView
	- 오토레이아웃없이 뷰를 자동배치(단점은 필요버전이 높다9.0버전부터)

## 제약사항 만들기



# UI

### Q.이미지쓸때 이미지가 눌리거나 깨지거나 아무튼 안됨
**A.** 이미지 설정창에 클립투바운드 뭐시기가 있으니 구지 코드를 쓰지않아도됩니다, 이미지가 크다면 지정해놓은 영역으로 잘라져서 보임니다

### Q.세로모드에서 가로모드했을때 너무 좁아져서 레이아웃이 망가져여

**A.** 아래있는 버튼들은 위치정보를 아래에서 주거나, 버티컬센터위치에서 비율로 주면 됨니다

버튼에 **전체 width에 80%**를 주고 **버튼 자체 width를 constant에서 등호로 가로 사이즈를 정해주고** priorty(우선순위)를 지정해주면 자기보다 강한 우선순위가 약한 우선순위를 무시한다. 그러면 비율로 설정해도 버튼 크기가 한없이 늘어나진 않는다. 개꿀

-
### 뷰컨트롤러랑 메인스토리보드랑 잘 연결되있는지 확인하고 뷰컨트롤러 이름을 바꿀때는 뷰컨트롤러 안에있는 클래스이름도 바꿔주세여
-





