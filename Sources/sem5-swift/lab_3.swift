import Foundation

struct lab_3 {
    static func task1() {
        let strSingleLine = "Single line String"
        let strMultipleLines = """
                               Multiple
                               line
                               string
                               """
        print(strSingleLine)
        print(strMultipleLines)
    }

    static func task2() {
        let text = """
                       
                   \tNauka kodowania to nie tylko nauka jezyka technologii.
                       
                   \tTo odkrywanie nowych sposobow myslenia
                       
                   \ti urzeczywistnianie rozmaitych koncepcji.
                       
                   """
        print(text)
    }

    static func task3() {
        let currentYear = 2021
        print("Podaj imie:")
        let name = readLine()!
        print("Podaj drugie imie:")
        let secondName = readLine()!
        print("Podaj nazwisko:")
        let surname = readLine()!
        print("Podaj rok urodzenia")
        let birthYear = readLine()!

        var text = "\(name) \(secondName) \(surname) \(birthYear)"
        print(text)

        if let range = text.range(of: secondName + " ") {
            text.removeSubrange(range)
        }
        print(text)

        if let range = text.range(of: " " + birthYear) {
            text.removeSubrange(range)
        }
        text.append(" \(currentYear - Int(birthYear)!)")
        print(text)

        if (name.lowercased().hasPrefix("d")) {
            print("Imie zaczyna sie litera \"D\"")
        } else {
            print("Imie nie zaczyna sie litera \"D\"")
        }
    }

    static func task4() {
        print("Podaj ciag:")
        let text = readLine()!.lowercased()
        print("Podaj znak:")
        let char = Character(readLine()!)
        print("Podaj liczbe calkowita")
        let number = Int(readLine()!)!

        if text.hasPrefix(String(char)) {
            print("Wczytany znak znajduje sie na poczatku ciagu")
        } else if text.hasSuffix(String(char)) {
            print("Wczytany znak znajduje sie na koncu ciagu")
        } else if text[text.index(text.startIndex, offsetBy: number)] == char {
            print("Wczytany znak znajduje sie na indeksie oddalonym o podana liczbe calkowita od poczatku ciagu")
        } else if text[text.index(text.endIndex, offsetBy: -number - 1)] == char {
            print("Wczytany znak znajduje sie na indeksie oddalonym o podana liczbe calkowita od konca ciagu")
        } else {
            print("Wczytany znak nie znajduje sie na zadnej z 4 mozliwych pozycji")
        }
    }

    static func task5() {
        print("Podaj ciag 1:")
        let text1 = readLine()!
        print("Podaj ciag 2:")
        let text2 = readLine()!
        print("Podaj prefix")
        let prefix = readLine()!
        print("Podaj sufix")
        let suffix = readLine()!

        if text1 == text2 {
            print("Oba ciagi sa identyczne")
        } else {
            print("Ciagi sa rozne")
        }

        if text1.hasPrefix(prefix) && text2.hasPrefix(prefix) {
            print("Prefix wystapuje w obu podanych ciagach")
        } else if text1.hasPrefix(prefix) {
            print("Prefix wystapuje tylko w pierwszym ciagu")
        } else if text2.hasPrefix(prefix) {
            print("Prefix wystepuje tylko w drugim ciagu")
        } else {
            print("Prefix nie wystepuje w podanych ciagach")
        }

        if text1.hasSuffix(suffix) && text2.hasSuffix(suffix) {
            print("Suffix wystepuje w obu podanych ciagach")
        } else if text1.hasSuffix(suffix) {
            print("Suffix wystepuje tylko w pierwszym ciagu")
        } else if text2.hasSuffix(suffix) {
            print("Suffix wystepuje tylko w drugim ciagu")
        } else {
            print("Suffix nie wystepuje w podanych ciagach")
        }
    }

    static func task6() {
        print("Podaj dlugosc boku a prostokata:")
        let a = Int(readLine()!)!
        print("Podaj dlugosc boku b prostokata")
        let b = Int(readLine()!)!
        let circumference = (a + b) * 2
        let area = a * b

        let text = """
                   Bok a: \(a)
                   Bok b: \(b)
                   Obwod: \(circumference)
                   Pole: \(area)
                   """
        print(text)
    }

    static func task7() {
        print("Podaj kwote w PLN:")
        let moneyInPLN = Double(readLine()!)!
        let USDToPLNExchangeRate = 3.9
        let moneyInUSD = moneyInPLN / USDToPLNExchangeRate
        print(String(format: "PLN: %.2lf", moneyInPLN))
        print(String(format: "USD: \u{0024}%.2lf", moneyInUSD))
    }
}