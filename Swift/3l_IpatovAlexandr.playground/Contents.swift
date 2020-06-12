import UIKit

func help(){
    print("Открыть/закрыть окна  - windowOpen\nЗапустить/Заглушить двигатель - motorOn\nЗагрузить в кузов/багажник - loadInTrunck\nВыгрузить из кузова/багажника - unloadFromTrunck")
}
enum Brand {
    case Volkswagen, GAZ, Honda
}

enum WindowState {
    case open, close
}
enum Transmission {
    case manual, auto
}

struct passengerСar {
    var brand: Brand
    var yearCarManufacture: Int
    let bootVolume: Double
    var motorOn: Bool
    var windowOpen: Bool
    var trunkFullness: Double
    
    func discription(){
        print("Марка машины: \(brand)\nГод выпуска \(yearCarManufacture) \nИмеет багажник вместимостью \(bootVolume) литров\nДвигатель \(motorOn)\nОкна открыты \(windowOpen)\nБагажник загружен на \(trunkFullness) литров")
    }
    mutating func motorOn(state: Bool) {
        switch state {
        case true:
            motorOn = true
            print("Двигатель запущен")
        default:
            motorOn = false
            print("Двигатель заглушен")
        }
    }
    mutating func windowOpen(state: Bool){
        switch state {
        case true:
            windowOpen = true
            print("Окна открылись")
        case false:
            windowOpen = false
            print("Окна закрылись")
        }
    }
    mutating func loadInTrunck(_ cargo: Double = 0) -> Double{
        trunkFullness = trunkFullness + cargo
        if trunkFullness == bootVolume {
            print("Багажник заполнен полностью")
        } else if trunkFullness > bootVolume {
            print("Багажник переполнен, выгрузите из него \(trunkFullness - bootVolume )")
        } else if trunkFullness < bootVolume {
            print("Погрузка завершена, можно загрузить еще \(bootVolume - trunkFullness)")
        }
        return trunkFullness
    }
    mutating func unloadFromTrunk(_ cargo: Double = 0) -> Double{
        trunkFullness = trunkFullness - cargo
        if trunkFullness == 0 || trunkFullness < 0 {
            trunkFullness = 0
            print("Богажник пуст")
        } else if trunkFullness > bootVolume {
            print("Выгрузка завершена, но багажник еще переполнен! Выгрузите из него \(trunkFullness - bootVolume )")
        } else if trunkFullness < bootVolume {
            print("Выгрузка завершена, в багажнике осталось \(trunkFullness)")
        } else if trunkFullness == bootVolume{
            print("Богажник полный")
        }
        return trunkFullness
    }
    
    init?(brand: Brand, yearCar: Int) {
        guard yearCar > 0  else {return nil}
        
        switch brand {
        case .Volkswagen:
            trunkFullness = 0
            bootVolume = 300
            motorOn = true
            windowOpen = true
            yearCarManufacture = yearCar
        case .GAZ:
            trunkFullness = 0
            bootVolume = 400
            motorOn = false
            windowOpen = true
            yearCarManufacture = yearCar
        case .Honda:
            trunkFullness = 0
            bootVolume = 200
            motorOn = false
            windowOpen = true
            yearCarManufacture = yearCar
        }
        self.brand = brand
    }
}

struct truck {
    let brand: Brand
    let yearCarManufacture: Int
    let bootVolume: Double
    var motorOn: Bool
    var windowOpen: Bool
    var trunkFullness: Double
    func discription(){
        print("Марка машины: \(brand)\nГод выпуска \(yearCarManufacture)\nИмеет кузов вместимостью \(bootVolume) литров\nДвигатель \(motorOn)\nОкна открыты \(windowOpen)\nКузов загружен на \(trunkFullness) литров")
    }
    
    mutating func motorOn(state: Bool) {
        switch state {
        case true:
            motorOn = true
            print("Двигатель запущен")
        default:
            motorOn = false
            print("Двигатель заглушен")
        }
    }
    
    mutating func windowOpen(state: Bool){
        switch state {
        case true:
            windowOpen = true
            print("Окна открылись")
        case false:
            windowOpen = false
            print("Окна закрылись")
        }
    }
    
    mutating func loadInTrunck(_ cargo: Double = 0) -> Double{
        self.trunkFullness = trunkFullness + cargo
        if trunkFullness == bootVolume {
            print("Кузов заполнен полностью")
        } else if trunkFullness > bootVolume {
            print("Кузов переполнен, выгрузите из него \(trunkFullness - bootVolume )")
        } else if trunkFullness < bootVolume {
            print("Погрузка завершена, можно загрузить еще \(bootVolume - trunkFullness)")
        }
        return trunkFullness
    }
    mutating func unloadFromTrunk(_ cargo: Double = 0) -> Double{
        self.trunkFullness = trunkFullness - cargo
        if trunkFullness == 0 || trunkFullness < 0 {
            trunkFullness = 0
            print("Кузов пуст")
        } else if trunkFullness > bootVolume {
            print("Выгрузка завершена, но кузов еще переполнен! Выгрузите из него \(trunkFullness - bootVolume )")
        } else if trunkFullness < bootVolume {
            print("Выгрузка завершена, в кузове осталось \(trunkFullness)")
        } else if trunkFullness == bootVolume{
            print("Богажник полный")
        }
        return trunkFullness
    }
    init?(brand: Brand, yearCar: Int) {
        guard yearCar > 0  else {return nil}
        
        switch brand {
        case .Volkswagen:
            trunkFullness = 0
            bootVolume = 1200
            motorOn = true
            windowOpen = true
            yearCarManufacture = yearCar
        case .GAZ:
            trunkFullness = 20
            bootVolume = 1000
            motorOn = false
            windowOpen = true
            yearCarManufacture = yearCar
        case .Honda:
            trunkFullness = 0
            bootVolume = 800
            motorOn = false
            windowOpen = true
            yearCarManufacture = yearCar
        }
        self.brand = brand
    }
}
var carFirst = passengerСar(brand: .Honda, yearCar: 2015)
carFirst?.loadInTrunck(20)
carFirst?.unloadFromTrunk(10)
carFirst?.unloadFromTrunk(5)
var carSecond = truck(brand: .Volkswagen, yearCar: 1990)

carSecond?.motorOn(state: false)
carSecond?.loadInTrunck(9999)
carSecond?.unloadFromTrunk(8799)
carSecond?.windowOpen(state: false)
carSecond?.discription()







