import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

//3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.



struct Queue<T>: CustomStringConvertible {
    var elements = [T]()
   
    
    init(_ elements: T...){
        self.elements = elements
    }
    mutating func enqueue(_ element: T){
        elements.append(element)
    }
    mutating func dequeue() -> T? {
        return elements.removeFirst()
    }
    var description: String {
        return "\(elements)"
    }
    
    subscript (index: Int) -> T? {
        guard index < elements.count else {return nil}
       
        return elements[index]
        }
    
}

var queue1 = Queue(1, 2, 3, 4)
queue1.dequeue()
print(queue1)
queue1.enqueue(10)
print(queue1)
var evenQueue1 = queue1.elements.filter{$0 % 2 == 0}
print(evenQueue1)
var moreThen3Queue1 = queue1.elements.filter{$0 > 3}
print(moreThen3Queue1)
print(queue1[1])
print(queue1[6])
