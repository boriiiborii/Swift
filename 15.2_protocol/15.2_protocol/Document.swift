import UIKit

//1)정의
protocol MyProtocol {
    //최소한의 요구사항 나열
}

class FamilyClass {}

//2)채택(클래스, 구조체, 열거형 다 가능)
class MyClass: FamilyClass, MyProtocol {
    //3)(속성/메서드) 구체적인 구현
}

//프로토콜을 채택하려는 클래스, 구조체, 열거형에 최소한 이런 내용을 구현해야한다고 선언하는 부분
//1. 속성요구사항
//2. 메서드의 요구사항(메서드/생성자/서브스크립트)

//프로토콜속성의 요구사항
//속성의 뜻에서 var로 선언(let으로 선언불가)
//get, set키워드를 통해서 읽기/쓰기 여부를 설정(최소한의 요구사항일뿐)
//저장속성/계산속성 모두 구현 가능

protocol RemoteMouse {
    
    var id:String {get} //let저장속성/ var저장속성/ 읽기계산속성/ 읽기쓰기 계산속성 가능
    
    var name:String {get set} // var저장속성/ 읽기,쓰기계산속성
    
    static var type: String {get set} // 타입계산속성(static, class)
    
}

//채택하면, 최소한의 요구사항을 정확하게 따라서 구현해야함
//인스턴스 저장/계산속성-----------
struct TV: RemoteMouse {
    var id: String = "456"
    
    var name: String = "애플티비"
    
    static var type:String = "리모콘"
}

let myTV = TV()
myTV.id
myTV.name
TV.type

//타입속성 ===========
//1)저장타입속성으로 구현
class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }
    
    var name: String {
        get {"아이폰"}
        set{ }
    }
    
    static var type: String = "리모콘"  //타입 저장 속성은 상속은 되지만 재정의 원칙적 불가능
}

//2)계산 타입 속성으로 구현
class Ipad: RemoteMouse {
    var id: String = "777"
    
    var name: String = "아이패드"
    
    class var type: String { //타입계산속성은 재정의 가능(class키워드 가능)
        get {"리모콘"}
        set {  }
    }
}
