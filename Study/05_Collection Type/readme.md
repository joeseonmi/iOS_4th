# Collection Type

> 클래스가 아니며, 변수에 할당하면 collection 변경가능, 상수에 할당되면 변경 불가능


### 🤔Array(배열)
- 배열 / Index: 순서가 있다
- 호출할때 Index번호를 사용한다
- 문법 var arrayName:[arrayType(Int,String...)] = []
- Index는 0부터 시작한다

- 배열 추가기능
	- ArrayName.count -> 배열의 element 갯수 확인
	- ArrayName.append -> 배열 element 추가
	- ArrayName.isEmpty -> 배열비었음?
	- ArrayName.insert -> 배열에 element삽입
	- ArrayName.remove(at:3) ->	배열의 3번째 element삭제
	- ArrayName.contains(3) -> 어떤 값의 유무?(배열타입이 Int	일때 bool값으로 배열에 3이 있는지 아닌지 알려줌) 

### 🤔Set
- 같은 타입의 데이터가 순서없이 모여있는 자료구조
- 순서 안중요
- 중복이되지않는것들을 집합처럼 모아둠
- Set을 정렬시키면 그냥 Array형식으로 나온다 (타입이바뀌는건X)
- 문법 set<element Type>	(array와 다르게 축약X)
- Set은 순서가 없기때문에 for_in으로 호출


- Set의 집합연산
	- a.interation(b) = a와 b의 교집합
	- a.symmetricDifference(b) = ab의 합집합 - ab의교집합
	- a.union(b) = ab의 합집합
	- a.subtrating(b) = a - b	


### 🤔Dictionary
- 순서 안중요함
- key값을 통해 호출
- 문법 Dictionary:[key:elemet Type] = []
ex) var dictionryName:[Int:String] = [1:"하나", 2:"둘"]


