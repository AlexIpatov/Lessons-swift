import UIKit




protocol Car {
    var color: UIColor { get set }
    var brand: String { get }
    var windowOpen: Bool { get set }
    var trunkVolume: Int { get }
    var trunkFullness: Int { get set }
    var engineOn: Bool { get set }
   
    
}

extension Car {
    
   
    mutating func startEngine() {
        guard !engineOn else {print("Двигатель уже включен")
            return}
        engineOn = true
        print("Двигатель работает")
    }
    mutating func stopEngine() {
        guard engineOn else {
            print("Двигатель уже выключен")
            return
        }
        engineOn = false
        print("Двигатель выключен")
    }
    mutating func openWindow() {
        guard !windowOpen else {print("Окна уже открыты")
            return
        }
        windowOpen = true
        print("Окна открыты")
        
    }
    mutating func  closeWindow(){
        guard windowOpen else {print("Окна уже закрыты")
            return
        }
        windowOpen = false
        print("Окна закрыты")
    }
    mutating func loadInTrunck(_ cargo: Int = 0){
        self.trunkFullness += cargo
        if trunkFullness == trunkVolume {
            print("Кузов заполнен полностью")
        } else if trunkFullness > trunkVolume {
            print("Кузов переполнен, выгрузите из него \(trunkFullness - trunkVolume )")
        } else if trunkFullness < trunkVolume {
            print("Погрузка завершена, можно загрузить еще \(trunkVolume - trunkFullness)")
        }
        
    }
    mutating func unloadFromTrunk(_ cargo: Int = 0){
        self.trunkFullness -= cargo
        if trunkFullness <= 0 {
            trunkFullness = 0
            print("Кузов пуст")
        } else if trunkFullness > trunkVolume {
            print("Выгрузка завершена, но кузов еще переполнен! Выгрузите из него \(trunkFullness - trunkVolume )")
        } else if trunkFullness < trunkVolume {
            print("Выгрузка завершена, в кузове осталось \(trunkFullness)")
        } else if trunkFullness == trunkVolume{
            print("Богажник полный")
        }
        
        
        
        
    }
    
}
class trunkCar: Car {
    var color: UIColor
    var brand: String
    var windowOpen: Bool
    var trunkVolume: Int
    var trunkFullness: Int
    var engineOn: Bool
    var trunkOpen: Bool
    var traler: Bool
    
    init(color: UIColor, brand: String, windowOpen: Bool, trunkVolume: Int, trunkFullness: Int, engineState: Bool, trunkState: Bool, traler: Bool){
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
        self.color = color
        self.brand = brand
        self.windowOpen = windowOpen
        self.engineOn = engineState
        self.traler = traler
        self.trunkOpen = trunkState
        
    }
    
}

class sportCar: Car {
    var color: UIColor
    var brand: String
    var windowOpen: Bool
    var trunkVolume: Int
    var trunkFullness: Int
    var engineOn: Bool
    var spoiler: Bool
    var sportModeOn: Bool
    init(color: UIColor, brand: String,  windowOpen: Bool, trunkVolume: Int, trunkFullness: Int, engineState: Bool, sportModeOn: Bool, spoiler: Bool) {
        
        self.spoiler = spoiler
        self.sportModeOn = sportModeOn
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
        self.color = color
        self.brand = brand
        self.windowOpen = windowOpen
        self.engineOn = engineState
    }
    
    
}


extension trunkCar: CustomStringConvertible{
    var description: String{
        return "Марка машины: \(brand)\nИмеет багажник вместимостью \(trunkVolume) литров\nДвигатель работает \(engineOn)\nОкна открыты \(windowOpen)\nБагажник загружен на \(trunkFullness) литров\nБагажник открыт \(trunkOpen)\nПрицеп есть \(traler)"
    }
}
extension sportCar: CustomStringConvertible{
    var description: String {
        return "Марка машины: \(brand)\nИмеет багажник вместимостью \(trunkVolume) литров\nДвигатель работает \(engineOn)\nОкна открыты \(windowOpen)\nБагажник загружен на \(trunkFullness) литров\nСпойлер \(spoiler)"
    }
    
    
}

var car1 = trunkCar(color: .black, brand: "GAZ", windowOpen: true, trunkVolume: 100, trunkFullness: 10, engineState: false, trunkState: true, traler: true)
var car2 = sportCar(color: .systemYellow, brand: "Mersedes", windowOpen: false, trunkVolume: 10, trunkFullness: 0, engineState: true, sportModeOn: true, spoiler: true)
car1.closeWindow()
car1.windowOpen
car1.loadInTrunck(100)
car1.trunkFullness
car1.startEngine()
print(car1.description)
car2.openWindow()
car2.loadInTrunck(100)
car2.startEngine()
car2.stopEngine()
car2.stopEngine()
print(car2.description)
