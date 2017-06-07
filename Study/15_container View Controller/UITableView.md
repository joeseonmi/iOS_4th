# UITableView

- 리스트의 형태로 정보를 보여준다
- 리스트 하나를 row라고 하고 row가 모여있는것을 Section이라고 한다.
- 인덱스리스트가 있다
- 그룹을 지을 수 있다.(셋팅화면처럼)

#### Protocol
데이터소스를 이용해 테이블뷰에 정보를 줘야 테이블 뷰가 구성된다.

1. DataSource
	* 테이블뷰에 보여줄 데이터를 관리할역할
	* @requires
	* 섹션별 로우의 갯수
	* row별 cell객체
	* 
2. Delegte
//1.윈도우만들기
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //2.스토리보드만들기
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewTableViewController") as! NewTableViewController
        
        //3.윈도우에 연결
        window?.rootViewController = vc
        window?.makeKeyAndVisible()