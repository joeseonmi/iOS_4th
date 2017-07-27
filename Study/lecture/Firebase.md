# Firebase

- 클라우드서비스를 제공하며, 백엔드기능이있다.
- 웹은 지원 안함

- 다양한 플랫폼과 기기에서 어플리케이션데이타를 실시간 동기화를 지원
>	- 모바일기기에서 쓰는 데이터와 서버에서 데이터 싱크 맞추기 힘들다
>	- Realm도 자동화 해주는데 Realm은 우리서버에 설치를 해야되는거 / Realm 무료도 있는데 그건 API를 못만든다
>	- Firebase는 서버에업데이트되고 -> 모든사람이 동기화 / Realm은 클라이언트에 업데이트되고 -> 서버에 동기화됨
>
- **[개발]** Authentication
>	- 인증과정(회원가입등)을 손쉽게 해줌
>	- 커스터마이징기능 제공(카톡/네이버 같은거 지원할 수 있게)
>	- 제일잘못된서비스는 SNS로그인을 시키고 또 메일과 비밀번호를 받는것
>	- 페이스북, 트위터, 깃헙, 구글은 SDK를 받아서 인증과정을 거치고, 우리쪽 Firebase에 토큰을 받아서 접근을 할 수 있음
>	
- **[개발]** Realtime Database => 실시간동기화
>	- 백엔드서비스를 제공 
>	- 개발자에게 하나의 API를 제공하고 어플리케이션데이터가 고객 그리고 저장된 Firebase클라우드와 자동 동기화되도록해준다.
>		- 오늘 실습: Insert, Delete, Select
>
- **[개발]** Storage
>	- 일련의 데이터(그림같은거), 무료로 저장가능 5G까지
>	- 웹에 일정한 공간이있고 무료로 있다고 생각하면된다.
>	- Q. 다운로드 요청이 몇 명인지에 따라 과금되는 경우가있는데? A. 요청수가 문제가아니라 트래픽발생비용이 문제인데(네트워크사용량) Firebase는 5G까지 무료임
>	- soCar의 경우 한달에 50G였는데 50불도 안나왔다고함, 개인은 구글 클라우드계정을 만들면 300불 크래딧을 주기때문에 트래픽비용을 무료로 쓸 수 있다고 생각하면 된다. 
>
- Crash Report
>	- 앱이 죽거나, 내가 구현한 미심쩍은 부분에 걸어놓으면 리포트를 받아볼 수 있다.
>	- 트위터에 패브릭같은건데 여기 통합됨

- **[분석]** Analytics등 지원 
>	- 구글이 모바일앱을 위해선보이는 완전히 새롭고 무제한사용할수있는 무료 분석솔루션
>	- 사용자이벤트중심적으로 설계
>	- 실시간으로 활성사용자들을 볼 수있음(앱 키면)
>	- 잠재고객이란, 앱을 설치해놓고 앱을 언제든지 쓸수 있다는거 / 앱을 깔았는데 id, pw,가입버튼 등에 이벤트를 다 심어놓고, Analytics에서 필터를 통해 확인 할 수 있다. 유입경로같은 경우 앱스토어에서 받았는지 아닌지 같은 경우도 알 수 있다. Streamview는 이벤트를 눌러서 바로 잡히지않는데 Stramview는 실시간으로 볼 수있음(안정적이진 않음). 사용자속성은 준회원 같은걸 구분할 수 있음.
>	- 이벤트를 적당히 심어두면 마케터나 데이터분석가들이 보고 분석함 / 쓸수있는데이터 없는데이터 등
>
- **[개발]** Firebase Cloud Messaging
>	- 노티피케이션같은건데, 사용제한없이 무료로 이용할수있고 iOS,Android및 웹플랫폼을 지원한다.
>	- 클라우드메시징을 쓰더라도 애플정책은 지켜야됨
>	- Firebase를 쓴다고 하지만, 애플서버를 거치긴 함 속도도 빠른편
>	- 애플에서 Noti보낼려면 복잡하고 힘든데, Cloud Messaging을 이용하면 쉽게가능
>	- 받는사람이 Noti를 받았는지 안받았는지 확인은 불가
>	- APNS를 구현안해도 웹에서 편하게 Noti쏠수이씀
>
- Firebase 중소기업정도에서 충분히 쓸수있음
