# Delegate
- iOS 델리게이트패턴
- 어떠한기술을 갖다쓰면 좋더라하는 방법론(패턴론)
- 프로토콜을 가지고 쓴다

-
05.29 아침수업으로 추가

-

## 프로토콜
- 프로토콜을 쓰는 이유는(예를들면 http) 내 컴퓨터와 내가 아닌 다른컴퓨터가 데이터를 주고받는다. 서로는 모르는사이고 데이터를 주기만하거나 받기만한다. 데이터를 주고받을때 어떠한 규칙이 필요하고 그런 규칙들을 프로토콜-통신규약-이라고 한다.
- 클래스를 만드는데 있어서의 약속(클래스를 어떻게 만들것인지에 대해서 약속을 정하는거/ex.함수+변수)
- 함수와 변수가 꼭 정의되어있다.
- 프로토콜을 채택하면 그함수와 변수를 꼭 사용해야된다.

## 델리게이트패턴 
- 내가 해야할 함수의 내용을 다른 클래스에게 위임
- 다른 클래스의 함수를 내가 실행시킨다
- 소유된클래스가 오너클래스에 어떤 행동을 받아서 쓸때 프로토콜을 통해 받아서 쓸 수있다. 프로토콜을 쓰는 이유는 서로의 메소드명을 통일 시키기 위한것임. 실질적인 행위는 소유된클래스가 하고, 행동에대한 지침은 오너클래스가 준다. 코드를 전달하는 행위로 델리게이트패턴. 코드를 소유된클래스가가 직접만들지않고 오너가만든 코드를 갖다쓰기만하고 코드는 오너가 만든다. 프로토콜을 통해서 해야할 일을 위임 / 컴파일러입장에서는 오너뷰에가서 코드를 읽고 돌아온다 /
- **"A에의해서 만들어진 B인스턴스가 B가해야할 일을 프로토콜(에 정의된 메서드)을 통해서 A가 하도록 대신 함수를 위임하는 디자인패턴"**

### textfieldDelegate
```swift
public protocol UITextFieldDelegate : NSObjectProtocol {

    
    @available(iOS 2.0, *)
    optional public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.

    @available(iOS 2.0, *)
    optional public func textFieldDidBeginEditing(_ textField: UITextField) // became first responder

    @available(iOS 2.0, *)
    optional public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

    @available(iOS 2.0, *)
    optional public func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

    @available(iOS 10.0, *)
    optional public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:

    
    @available(iOS 2.0, *)
    optional public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text

    
    @available(iOS 2.0, *)
    optional public func textFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)

    @available(iOS 2.0, *)
    optional public func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    
```
-

-

## UIScrollView

- 오토레이아웃으로 만드는데 예외상황으로빠짐(특정한 룰이있고 그대로 만들어야됨)

#### ContentView
- 스크롤뷰 뒤에 컨텐츠뷰가 존재(컨텐츠뷰는 스크롤뷰보다 커야한다) 스크롤뷰는 **실제보이는**화면 컨텐츠뷰는 지도에 더 넓은 부분이라고 할수있음

- 코드를 통해 만들게되면 컨텐츠뷰의 사이즈를정할수있다 스토리보드로 만들게되면 사이즈를 정할수 없어서 이걸 만드는 특이한 방법이 있다

```swift
// 스크롤뷰 속성들
open class UIScrollView : UIView, NSCoding {

    
    open var contentOffset: CGPoint // default CGPointZero

    open var contentSize: CGSize // default CGSizeZero

    open var contentInset: UIEdgeInsets // default UIEdgeInsetsZero. add additional scroll area around content

    weak open var delegate: UIScrollViewDelegate? // default nil. weak reference

    open var isDirectionalLockEnabled: Bool // default NO. if YES, try to lock vertical or horizontal scrolling while dragging

    open var bounces: Bool // default YES. if YES, bounces past edge of content and back again

    open var alwaysBounceVertical: Bool // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag vertically

    open var alwaysBounceHorizontal: Bool // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag horizontally

    open var isPagingEnabled: Bool // default NO. if YES, stop on multiples of view bounds

    open var isScrollEnabled: Bool // default YES. turn off any dragging temporarily

    open var showsHorizontalScrollIndicator: Bool // default YES. show indicator while we are tracking. fades out after tracking

    open var showsVerticalScrollIndicator: Bool // default YES. show indicator while we are tracking. fades out after tracking

    open var scrollIndicatorInsets: UIEdgeInsets // default is UIEdgeInsetsZero. adjust indicators inside of insets

    open var indicatorStyle: UIScrollViewIndicatorStyle // default is UIScrollViewIndicatorStyleDefault

    @available(iOS 3.0, *)
    open var decelerationRate: CGFloat

    open var indexDisplayMode: UIScrollViewIndexDisplayMode

    
    open func setContentOffset(_ contentOffset: CGPoint, animated: Bool) // animate at constant velocity to new offset

    open func scrollRectToVisible(_ rect: CGRect, animated: Bool) // scroll so rect is just visible (nearest edges). nothing if rect completely visible

    
    open func flashScrollIndicators() // displays the scroll indicators for a short time. This should be done whenever you bring the scroll view to front.
```
### 스토리보드에서 스크롤뷰
- 스토리보드를 늘린다 (프리폼으로)
- 스크롤뷰를깐다 (스크롤뷰는 뷰컨트롤러 크기에 맞췄기때문에 변할 수 있다)
- 그위에 다시 뷰를 올린다(컨텐츠뷰는 높이를 고정해놓았기때문에 줄어들지않는다)

### 스크롤뷰를 이용해서 키보드가 올라왔을 때 입력창 가리지않게 같이 올려주기
- 뷰를 선택하고 `editor - embed in - scroll` 하면 스크롤뷰가 생기고 오토레이아웃 다시잡아줘야되니까 처음부터 고려하고 만들자^^
- 스토리보드에서 텍스트필드잡고 뷰컨트롤러선택해서 델리게이트 연결해줄수있고, 뷰컨트롤러에 델리게이트 호출된상태여야됨


