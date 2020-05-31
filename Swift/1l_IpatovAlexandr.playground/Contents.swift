import UIKit


//1
var a: Double = 2 //коэффициент а
var b: Double  = 10 //коэффициент b
var c: Double  = 2 //коэффициент с
var d:Double = pow(b, 2) - 4 * a * c
if(d<0){
    print("Нет корней для уравнения " + String(a) + "x^2+" + String(b) + "x+" + String(c) + "=0")
}else if(d>0){
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    print("Корни уравнениня " + String(a) + "x^2+" + String(b) + "x+" + String(c) + "=0: x1= " + String(x1) + " x2= " + String(x2))
}else if(d==0){
    let x1 = -b / (2 * a)
    print("Корень уравнения " + String(a) + "x^2" + String(b) + "x+" + String(c) + "=0 равен " + String(x1))
}


//2

var kat1: Double = 3// Первый катет
var kat2: Double = 4 // Второй катет
var gip: Double = sqrt(pow(kat1, 2) + pow(kat2, 2)) // Гипотенуза
var per = kat2 + kat1 + gip // Периметр
var s = kat1 * kat2 / 2 // Площадь
print("Гипотенуза треугольника равна " + String(gip) + ". Периметр треугольника равен " + String(per) + ". Площадь треугольника равна " + String(s))

//3
var sum: Double = 7000 //Изначальная сумма вклада
var prs: Double = 5 // Процент вклада
var time: Double = 5 // Кол-во лет

var sumAfter5: Double = sum * pow((1 + prs / 100), time)

print("На Вашем счету через " + String(Int(time)) + " лет будет " + String(Int(sumAfter5)) + " при процентной ставке " + String((prs)))

