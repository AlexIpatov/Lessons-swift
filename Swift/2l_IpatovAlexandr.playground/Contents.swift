import UIKit

//1
func evenNum(_ a: Int){
    if (a % 2) == 0{
        print("Число \(a) четное")
    } else {
        print("Число \(a) нечетное")
    }
}
print("Задание номер 1:")
evenNum(8)
print("================================")


//2
func divides3(_ a: Int){
    if (a % 3) == 0{
        print("Число \(a) делится без остатка на 3")
    } else {
        print("Число \(a) не делится без остатка на 3")
    }
}
print("Задание номер 2:")
divides3(9)
print("================================")


//3
var array100: [Int] = []
for index in 1...100{
    array100.append(index)
}
print("Задание номер 3:")
print(array100)
print("================================")


//4
for (_, value) in array100.enumerated(){
    if (value % 2) == 0 || (value % 3) != 0 {
        array100.remove(at: array100.firstIndex(of: value)!)
    }
}
print("Задание номер 4")
print(array100)
print("================================")


//5
func addFibonacciArr(n: Int) -> [Double] {
    assert(n > 1)
    var array: [Double] = [0, 1]
    while array.count < n {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    return array
}
print("Задание номер 5")
print(addFibonacciArr(n: 100))
print("================================")


//6 Решил не предложенным методом
func isItPrime(_ num: Int) -> Bool {
    if num == 2 || num ==  3 {
        return true
    } else {
        let maxDiv = Int(sqrt(Double(num)))
        return num > 1 && !(2...maxDiv).contains { num % $0 == 0}
    }
}
var i = 1
var element = 0
var arrayForPrime: [Int] = []
while i <= 100{
    if isItPrime(element) == true{
        arrayForPrime.append(element)
        element += 1
        i += 1
    } else {
        element += 1
    }
}
print("Задание номер 6")
print(arrayForPrime)
print("================================")



















