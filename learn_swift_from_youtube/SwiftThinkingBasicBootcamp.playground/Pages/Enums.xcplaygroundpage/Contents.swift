import Foundation

struct CarModel {
    let brand: CardBrandOption
    let model: String
}

struct CarBrand {
    let title: String
}

enum CardBrandOption {
    case ford
    case toyota
    
    var title: String {
//        if self == .ford {
//            return "Ford"
//        } else if self == .toyota {
//            return "Toyato"
//        } else {
//            return "Default value"
//        }
        
        switch self {
        case .ford:
            return "Ford"
        case .toyota:
            return "Toyota"
        }
    }
    
}
//
//var car1: CarModel = CarModel(brand: "Ford", model: "Fiesta")
//var car2: CarModel = CarModel(brand: "Ford", model: "Focus")
//var car3: CarModel = CarModel(brand: "Toyota", model: "Camry")
//
//var brand1 = CarBrand(title: "Ford")
//var brand2 = CarBrand(title: "Toyato")
//
//var car1 = CarModel(brand: brand1, model: "Fiesta")
//var car2 = CarModel(brand: brand1, model: "Focus")
//var car3 = CarModel(brand: brand2, model: "Camry")

var car1 = CarModel(brand: .ford, model: "Fiesta")
var car2 = CarModel(brand: .ford, model: "Focus")
var car3 = CarModel(brand: .toyota, model: "Camry")


var fordBrand: CardBrandOption = .ford

print(fordBrand.title)
