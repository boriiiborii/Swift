
import UIKit

//15.1 프로토콜 규약/협약

protocol SomeProtocol {
    func playpiano()
}

struct MyStruct: SomeProtocol {
    func playpiano() {
        print("피아노를 친다")
    }
}

class MyClass: SomeProtocol {
    var number = 1
    func playpiano() {
        print("클래스 피아노 니나노")
    }
}


//--------------------------------

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
    
    func fly() {
        print("새가 하늘로 날아간다")
    }
}


class Eagle: Bird {
    //isFemale
    //layEgg()
    //fly()
    
    func soar() {
        print("공중으로 치솟아 난다.")
    }
}

class Penguin: Bird {
    //isFemale
    //layEgg()
    
    //fly()    //상속구조에는 펭귄이 어쩔 수 없이 날게 됨
    
    func swim() {
        print("헤엄친다.")
    }
}

class Airplane: Bird {
    //isFemale
    //layEgg()  //상속구조에서 비행기가 날게됨
    
    override func fly() {
        print("비행기가 엔진을 사용해서 날아간다.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.fly() //문제 펭귄이 날게됨
myPenguin.layEgg()
myPenguin.swim()

let myAirplane = Airplane()
myAirplane.fly()
myAirplane.layEgg()//문제 비행기가 알을 낳음

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myPenguin)
museum.flyingDemo(flyingObject: myAirplane)


//프로토콜은 위와 같은 상황을 해결해주는 해결책 >> 프로토콜
//-------------------------------------

protocol CanFly {
    func fly() //구체적인 구현안함 >> 구체적인 구현은 자격증 채택한 곳에서
}

class Bird1 {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
    
}

class Eagle1: Bird1, CanFly {
    //isFemale
    //layEgg()
    
    func fly() {    //프로토콜
        print("독수리가 하늘로 날아올라 간다.")
    }
    
    func soar() {
        print("공중으로 활공한다.")
    }
}


class Penguin1: Bird1 {
    //isFemale
    //layEgg()
    
    func swim() {
        print("물 속을 헤엄칠 수 있다.")
    }
}

struct Airplane1: CanFly{ //구조체에서도 프로토콜 채택이 가능하다.
    func fly() {
        print("비행기가 날아간다.")
    }
}

struct FlyingMuseum1 {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

let myEagle1 = Eagle1()
myEagle1.fly()
myEagle1.layEgg()
myEagle1.soar()

let myPenguin1 = Penguin1()
myPenguin1.layEgg()
myPenguin1.swim()
//myPenguin1.fly()  >>더이상 펭귄이 날지 않음

let myPlane1 = Airplane1()
//myPlane1.layEgg()  >>더이상 비행기가 알을 낳지 않음
myPlane1.fly()

let museum1 = FlyingMuseum1()
museum1.flyingDemo(flyingObject: myEagle1)
museum1.flyingDemo(flyingObject: myPlane1)

//----------------------------------------------
//----------------------------------------------
