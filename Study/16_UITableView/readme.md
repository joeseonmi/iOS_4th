## TableView
- 델리게이트: VC에의해서 만든 테이블뷰가 만들어지는 과정에서 필요한 필수정보를 DataSource라는 프로토콜을 이용해서 VC에 위임하고 뷰컨트롤러가 준 (테이블뷰구성에 필요한것들을)정보를 가지고 테이블을 만든다(cell은 정보일뿐임)로우와 섹션을 통해서 구분할 수 있고. 테이블뷰가 VC한테 Cell만들어달라고 프로토콜을 하면 VC가 만든걸 테이블뷰데이터를 받아다가 구성한다.

- UITableViewController는 루트뷰가 테이블뷰이고, 프로토콜을 채택한 컨트롤러. 

- 테이블뷰의 가장 큰 특징은 Reusable (cellforRowAtIndex 이라는 데이터소스메소드에서 사용. Cell이 화면에 필요할때마다 불린다. 초기에 화면에 몇개가 필요한거에 따라서 갯수만큼 불린다.reuse는 테이블뷰가 판단해서 한다.)
## TableView Reusable 😊

* 오토레이아웃 설정할때 탑바텀을 잡는게 아니라 센터를 잡아야 네비게이션바가 들어왔을때 적절하게 떨어짐

* datasource를 구현하는데 이거 프로토콜하고 구현안하면 에러뜸, 프로토콜부르면 무조건 써야댐


* cell설정할때 tableView한테 보내는거(델리게이트자체가 tableView델리게이트)
* 셀은 첫화면에 뜰때만 한번에 불리고 스크롤할때마다 아랫것들이 불린다. 화면에 나타날때마다 불리는거임

* tableView dequeueReusableCell -> 데이터가 큐 형태(deque 큐에서 끄집어낸다, enque 큐에 넣는다) 그래서 셀이 많을때 위로 알라가서 안보이게 되는 셀이 큐로 다시 들어간다. reusable은 큐로 다시 들어갔던 셀을 재사용해서 아래 스크롤로 나온다. 만약에 reusable할게 없으면 인스턴스를 다시 생성한다.

* 그래서 cellforrow에서는 인스턴스를 생성하면 안된다 스크롤하면서 인스턴스를 계속 만들게되기때문😩

* 스토리보드로 만들면 cell이 옵셔널이아닌데 코드로 만들면 cell이 옵셔널일 수 있다. (스토리보드를 안쓰게된다면 처음 만드는 부분을 if문을 통해 제한을 둬야한다)

```swift
if cell == nil
{
cell = UITableViewCell(style:.default, reuseIdentifier:"Cell")
}
```
**셀이 닐이 아닐때 재사용**
만약 코드로만 만들어서 셀의 CGRect값을 줘야한다면 if문안에 넣는게 적절함. 밖에다 하면 계속 인스턴스화되기때문에

#### didSelectRowAt
row를 클릭했을때 다음페이지로 넘어갈때 세그를 사용하면 된다. (SelectedSegue)

prepare을 통해 다음 페이지에 데이터를 넘겨준다.(segue.destination)


