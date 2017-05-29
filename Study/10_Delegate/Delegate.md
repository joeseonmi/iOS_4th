# Delegate
- iOS 델리게이트패턴
- 어떠한기술을 갖다쓰면 좋더라하는 방법론(패턴론)
- 프로토콜을 가지고 쓴다

## 프로토콜
- 프로토콜을 쓰는 이유는(예를들면 http) 내 컴퓨터와 내가 아닌 다른컴퓨터가 데이터를 주고받는다. 서로는 모르는사이고 데이터를 주기만하거나 받기만한다. 데이터를 주고받을때 어떠한 규칙이 필요하고 그런 규칙들을 프로토콜-통신규약-이라고 한다.
- 클래스를 만드는데 있어서의 약속(클래스를 어떻게 만들것인지에 대해서 약속을 정하는거/ex.함수+변수)
- 함수와 변수가 꼭 정의되어있다.
- 프로토콜을 채택하면 그함수와 변수를 꼭 사용해야된다.

## 델리게이트패턴 
- 내가 해야할 함수의 내용을 다른 클래스에게 위임
- 다른 클래스의 함수를 내가 실행시킨다

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