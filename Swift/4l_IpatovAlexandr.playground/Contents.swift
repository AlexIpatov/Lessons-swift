import UIKit
enum Brand {
    case Volkswagen, GAZ, Honda
}

enum WindowState {
    case open, close
}
enum EngineState{
    case on, off
}
enum SportMode{
    case on, off
}
enum TrunkState{
    case open, close
}
class car {
    var color: UIColor
    var brand: Brand
    var windowState: WindowState
    var trunkVolume: Int
    var trunkFullness: Int
    var engineState: EngineState
    init(color: UIColor, brand: Brand, windowState: WindowState, trunkVolume: Int,
         trunkFullness: Int,  engineState: EngineState){
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
        self.color = color
        self.brand = brand
        self.windowState = windowState
        self.engineState = engineState
    }
    func startEngine() {
        engineState = .on
        print("Двигатель работает")
    }
    func stopEngine() {
        engineState = .off
        print("Двигатель выключен")
    }
    func openWindow() {
        windowState = .open
        print("Окна открыты")
        
    }
    func  closeWindow(){
        windowState = .close
        print("Окна закрыты")
    }
    func loadInTrunck(_ cargo: Int = 0){
        self.trunkFullness += cargo
        if trunkFullness == trunkVolume {
            print("Кузов заполнен полностью")
        } else if trunkFullness > trunkVolume {
            print("Кузов переполнен, выгрузите из него \(trunkFullness - trunkVolume )")
        } else if trunkFullness < trunkVolume {
            print("Погрузка завершена, можно загрузить еще \(trunkVolume - trunkFullness)")
        }
        
    }
    func unloadFromTrunk(_ cargo: Int = 0){
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
    func showCarState(){
        print("Марка машины: \(brand)\nИмеет кузов вместимостью \(trunkVolume) литров\nДвигатель \(engineState)\nОкна \(windowState)\nКузов загружен на \(trunkFullness) литров")
    }
}
class trunkCar: car {
    var trunkState: TrunkState
     var traler: Bool
    init(color: UIColor, brand: Brand, windowState: WindowState, trunkVolume: Int, trunkFullness: Int, engineState: EngineState, trunkState: TrunkState, traler: Bool){
        self.traler = traler
        self.trunkState = trunkState
        super.init(color: color, brand: brand, windowState: windowState, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState)
    }
    
    func openTrunk(){
        trunkState = .open
        print("Багажник открыт")
    }
    func closeTrunk(){
        trunkState =  .close
        print("Багажник закрыт")
        }
   override func showCarState(){
           print("Марка машины: \(brand)\nИмеет багажник вместимостью \(trunkVolume) литров\nДвигатель \(engineState)\nОкна \(windowState)\nБагажник загружен на \(trunkFullness) литров\nБагажник \(trunkState)\nПрицеп \(traler)")
       }
}



class sportCar: car {
    var spoiler: Bool
    var sportMode: SportMode
    init(color: UIColor, brand: Brand, windowState: WindowState, trunkVolume: Int, trunkFullness: Int, engineState: EngineState, sportMode: SportMode, spoiler: Bool) {
        self.spoiler = spoiler
        self.sportMode = sportMode
        super.init(color: color, brand: brand, windowState: windowState, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState)
    }
    func onSportMode(){
        sportMode = .on
        print("Спортивный режим включен")
    }
    func offSportMode(){
        sportMode = .off
        print("Спортивный режим выключен")
        }
   override func showCarState(){
           print("Марка машины: \(brand)\nИмеет багажник вместимостью \(trunkVolume) литров\nДвигатель \(engineState)\nОкна \(windowState)\nБагажник загружен на \(trunkFullness) литров\nСпойлер \(spoiler)")
       }
    }




var car1 = sportCar(color: .black, brand: .Volkswagen, windowState: .close, trunkVolume: 100, trunkFullness: 0, engineState: .on, sportMode: .off, spoiler: true)
var car2 = trunkCar(color: .white, brand: .GAZ, windowState: .open, trunkVolume: 2000, trunkFullness: 10, engineState: .off, trunkState: .close, traler: true)
var car3 = sportCar(color: .blue, brand: .Honda, windowState: .open, trunkVolume: 200, trunkFullness: 10, engineState: .off, sportMode: .off, spoiler: false)
var car4 = trunkCar(color: .darkText, brand: .Volkswagen, windowState: .close, trunkVolume: 1000, trunkFullness: 1000, engineState: .on, trunkState: .close, traler: false)



car1.startEngine()
car1.stopEngine()
car1.openWindow()
car1.closeWindow()
car1.onSportMode()
car1.offSportMode()
car1.loadInTrunck(1000)
car1.unloadFromTrunk(900)

car1.showCarState()

car2.startEngine()
car2.stopEngine()
car2.openWindow()
car2.closeWindow()
car2.openTrunk()
car2.loadInTrunck(110)
car2.unloadFromTrunk(90)
car2.closeTrunk()

car2.showCarState()
