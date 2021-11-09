import Foundation

struct lab_4 {
    static func task_1() {
        print("Podaj rok:")
        guard let year = Int(readLine()!) else {
            fatalError("Podano bledny rok")
        }

        if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
            print("Rok jest przestepny")
        } else {
            print("Rok nie jest przestepny")
        }
    }

    static func task_2() {
        let roman = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
                     "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
                     "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
                     "XXXI"]
        print("Podaj rok:")
        guard let year = Int(readLine()!) else {
            fatalError("Podano bledny rok")
        }

        let remainder = year % 100
        let a = year / 100
        let century: String
        if remainder != 0 {
            century = roman[a]
        } else {
            century = roman[a - 1]
        }
        print("Wiek: \(century)")
    }

    static func task_3() {
        print("Podaj srednia:")
        guard let average = Double(readLine()!) else {
            fatalError("Podano niepoprawna srednia")
        }
        let scholarship: Int

        switch average {
        case 4.5...5: scholarship = 200
        case 4.0..<4.5: scholarship = 150
        case 3.0..<4.0: scholarship = 100
        case 2.0..<3.0: scholarship = 0
        default: fatalError("Srednia nie nalezy do zakresu")
        }

        print("Punkty: \(scholarship)")
    }

    static func task_4() {
        print("Podaj pierwsza liczbe:")
        guard let a = Double(readLine()!) else {
            fatalError("Podano niepoprawna liczbe")
        }
        print("Podaj druga liczbe:")
        guard let b = Double(readLine()!) else {
            fatalError("Podano niepoprawna liczbe")
        }

        while true {
            print("""
                  1 - dodawanie
                  2 - odejmowanie
                  3 - mnozenie
                  4 - dzielenie
                  """)

            guard let choice = Double(readLine()!) else {
                print("Takiej opcji nie ma w menu")
                continue
            }

            switch choice {
            case 1: print(a + b)
            case 2: print(a - b)
            case 3: print(a * b)
            case 4 where b != 0: print(a / b)
            case 4: print("Dzielenie przez zero")
            default: print("Bledny wybor, sprobuj ponownie.")
            }
            print()
        }
    }

    static func task_5() {
        print("Podaj kod pocztowy:")
        let postalCode = readLine()!
        if postalCode.count != 5 && postalCode.count != 6 {
            fatalError("Podany kod jest zlej dlugosci")
        }
        guard let firstChar = postalCode.first else {
            fatalError("Nie udalo sie uzyskac pierwszego znaku")
        }

        let region: String
        switch firstChar {
        case "0": region = "warszawskie"
        case "1": region = "olsztynskie i bialostockie"
        case "2": region = "lubelskie i kieleckie"
        case "3": region = "krakowskie i rzeszowskie"
        case "4": region = "katowickie i opolskie"
        case "5": region = "wroclawskie"
        case "6": region = "poznanskie i zielonogorskie"
        case "7": region = "szczecinskie i koszalinskie"
        case "8": region = "gdanskie i bydgoskie"
        case "9": region = "lodzkie"
        default:
            fatalError("Wprowadzono bledne dane")
        }

        print("Wojewodztwo: \(region)")
    }

    static func task_6() {
        print("Podaj znak z klawiatury")
        let x = readLine()!
        if x.count > 1 {
            fatalError("Podano wiecej niz jeden znak")
        }

        var result: String
        switch x {
        case "a", "e", "i", "o", "u", "y":
            result = "samogloska"
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "w", "z":
            result = "spolgloska"
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            result = "cyfra"
        default:
            result = "inny"
        }
        print("Podany znak to \(result)")
    }

    static func task_7() {
        print("Podaj PESEL:")
        let pesel = readLine()!
        if pesel.count != 11 {
            fatalError("Niepoprawna dlugosc PESEL")
        }

        guard let x = Int(String(pesel[pesel.index(pesel.endIndex, offsetBy: -2)])) else {
            fatalError("Niepoprawny format PESEL")
        }

        switch x {
        case 1, 3, 5, 7, 9:
            print("Mezczyzna")
        default:
            print("Kobieta")
        }
    }
}