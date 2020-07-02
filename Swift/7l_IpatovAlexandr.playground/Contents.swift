import UIKit
enum PossibleErrors: Error {
    case notInStock
    case notEnouthMoney
}
struct Book {
    let price: Int
    var count: Int
}


class Library {

   private var libraryBooks = ["Преступление и наказание": Book(price: 10, count: 1), "Война и мир": Book(price: 11, count: 0), "Колобок": Book(price: 12, count: 3)]
    
    func getTheBook(name:String) throws {
        guard var book = libraryBooks[name] else {
            throw PossibleErrors.notInStock
        }
        guard book.count > 0 else {
            throw PossibleErrors.notInStock
        }
        guard book.price <= deposit else {
            throw PossibleErrors.notEnouthMoney
        }
        deposit -= book.price
        book.count -= 1
        libraryBooks[name] = book
        print("Вы получили книгу: \(name)")
    }
}
let library = Library()
var deposit = 3
do {
    try library.getTheBook(name: "Преступление и наказание")
    
} catch PossibleErrors.notInStock{
    print("Такой книги нет в продаже")
    
} catch PossibleErrors.notEnouthMoney {
    print("У вас недостаточно средств")
}

deposit = 100
do {
    try library.getTheBook(name: "Преступление и наказание")
    
} catch PossibleErrors.notInStock{
    print("Такой книги нет в продаже")
    
} catch PossibleErrors.notEnouthMoney {
    print("У вас недостаточно средств")
}
deposit = 100
do {
    try library.getTheBook(name: "Идиот")
    
} catch PossibleErrors.notInStock{
    print("Такой книги нет в продаже")
    
} catch PossibleErrors.notEnouthMoney {
    print("У вас недостаточно средств")
}

//-------------------------------------------


enum PossibleErrorsForFilms: Error{
    case notInLibrary
    case notEnoughRating
}
struct FilmName {
    let film: String
}
struct FilmInfo {
    let filmRating:Float
    let filmName: FilmName
}


class FilmLibrary {
    
    var filmLibrary = ["Большой куш": FilmInfo(filmRating: 8.5, filmName: FilmName(film: "Большой куш")), "Пираты карибского моря": FilmInfo(filmRating: 7, filmName: FilmName(film: "Пираты карибского моря")), "Властелин колец":FilmInfo(filmRating: 9, filmName: FilmName(film: "Властелин колец")) ]
    
    var requiredRating: Float = 8
    
    func showFilm(_ film: String) -> (FilmName?, Error?){
        guard let item = filmLibrary[film] else {
            return (nil, PossibleErrorsForFilms.notInLibrary)
        }
        guard item.filmRating >= requiredRating else {
            return (nil, PossibleErrorsForFilms.notEnoughRating)
        }
       print("Фильм \(film) имеет достаточный рейтинг для просмотра")
        return (item.filmName, nil)
    }
    
}

var filmLibrary = FilmLibrary()

let tryToChooseMovieOne = filmLibrary.showFilm("Большой куш")

let tryToChooseMovieTwo = filmLibrary.showFilm("Пираты карибского моря")
print(tryToChooseMovieTwo)

