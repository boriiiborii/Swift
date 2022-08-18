import UIKit


//메서드의 요구사항 정의하는 방법
//프로토콜메서드요구사항
//메서드의 헤드부분의 형태만 요구사항으로 정의
//mutating키워드: 구조체로제한하는거아님. 구조체에서 저장속성을 변경하는 경우, 구조체도 채택 가능하도록 허락하는 키워드
//타입메서드로 정의하려면 static키워드만 붙이면 됨
//채택해서 구현하는 쪽에서 static class키워드 모두 사용

//1)정의
protocol RandomNumber {
    static func reset()
    func random() -> Int
    //mutating func doSomthing()
}

//2)채택 및 구현
class Number: RandomNumber {
    
    static func reset() {
        print("다시 세팅")
    }
    
    func random() -> Int {
        return Int.random(in:1...100)
    }
}

let n = Number()
n.random()
Number.reset()

//1)정의
protocol Togglable {
    mutating func toggle()
}

//2)채택 및 구현
enum OnOffSwitch: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var s = OnOffSwitch.off
s.toggle()
s.toggle()

class BigSwitch: Togglable {
    var isOn = false
    func toggle() {
        isOn = isOn ? false : true
    }
}

var big = BigSwitch()
print(big.isOn)
big.toggle()
print(big.isOn)





//메서드 요구사항 = 생성자 요구사항

protocol Someprotocol {
    init(num: Int)
}

//생서자요구사항
//클래스는 생성자 앞에 required를 붙여야함(하위구현강제) (구조체의 경우 상속이 없기 때문에 , requried키워드 필요없음)
//아니면 final을 붙여서 상속을 막으면 required생략가능
//클래스에서는 반드시 지정생성자로 구현할 필요는 없음(편의생성자로 구현도 가능)

//예제1
class SomeClass: Someprotocol {
    required init(num: Int){ //실제 구현
        
    }
}

class SomeSubClass: SomeClass {
    //하위클래스에서 생성자 구현을 안하면 필수 생성자는 자동 상속
    //requried init(num: Int)
}

//예제2
protocol AProtocol {
    init()
}

class ASuperClass {
    init() {
        //생성자의 내용 구현
    }
}

class BSubClass: ASuperClass, AProtocol {
    //AProtocol을 채택함으로 "reuired"키워드가 필요하고, 상속으로 인한 override(재정의)" 재정의 키워드도 필요
    required override init() {
        
    }
}




//------------------------------------
//생성자의 요구사항 - 실패가능 생성자의 경우
//init?() >> init()/init?()/init!()로구현가능
//init() >> init?()로 구현 불가능. 범위가 더 넓어지는것 불가

//실패가능 생성자
protocol Aproto {
    init?(num: Int)
}

struct AStrutct: Aproto {
    //init?(num: Int) {{
    init(num: Int) {}
    //init!(num: Int) {} //이거도 괜찮음
}

//클래스에서 채택
class AClass: Aproto{
    required init(num: Int) {}
}



//-----------------------------------------
//메서드 요구사항 - 서브스크립트 요구사항
//get set 키워드 통해서 읽기/쓰기 여부를 설정(최소한의 요구사항일뿐)
//get키워드 >> 최소한의 읽기 서브스크립트구현/읽기,쓰기 모두 구현가능
//get 키워드 >> 반드시 읽기, 쓰기 모두 구현해야함

protocol DataList {
    subscript(idx: Int) -> Int{get} //(서브스크립트 문법에서) get 필수 (set선택)
}

struct DataStructure: DataList {
    //subscript(idx: Int) -> Int {//읽기전용 서브스크립트로 구현한다면
    //  get{
    //      return 0
    //  }
    //}
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            //상세구현
        }
    }
}


//---------------------------------------------
//관습적인 프로토콜 채택과 구현 - 확장에서
protocol Certificate {
    func doSomething()
}

class Person {
    
}

//관습적으로 본체보다는 확장에서, 채택구현(코드의 깔끔한 정리 가능)
extension Person: Certificate{
    func doSomething() {
        print("Do Something")
    }
}

var a = Person()
a.doSomething()

