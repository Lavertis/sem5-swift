import Foundation

struct lab_4 {
    static func task_1() {
        print("Podaj rok:")
        guard let year = Int(readLine()!) else {
            fatalError("To nie jest poprawny rok")
        }

        if year % 4 == 0 {
            print("Rok jest przestepny")
        } else {
            print("Rok nie jest przestepny")
        }
    }

    static func task_2() {
        let roman = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
                     "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
                     "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX"]
        guard let year = Int(readLine()!) else {
            fatalError("To nie jest poprawny rok")
        }

        let remainder = year % 100
        let a = year / 100
        let century: String
        if remainder != 0 {
            century = roman[a]
        } else {
            century = roman[a - 1]
        }
        print(century)
    }

    static func task_3() {
        guard let average = Double(readLine()!) else {
            fatalError("Niepoprawna srednia")
        }
        var points: Int

        switch average {
        case 4.5...: points = 200
        case 4.0..<4.5: points = 150
        case 3.0..<4.0: points = 100
        case ..<3.0: points = 0
        default: points = 0
        }

        print("Punkty: \(points)")
    }

    static func task_4() {
        print("Podaj pierwsza liczbe:")
        guard let a = Double(readLine()!) else {
            fatalError("Podaj poprawna liczbe")
        }
        print("Podaj druga liczbe:")
        guard let b = Double(readLine()!) else {
            fatalError("Podaj poprawna liczbe")
        }
        while true {
            print("""
                  1 - dodawanie
                  2 - odejmowanie
                  3 - mnozenie
                  4 - dzielenie
                  """)

            switch Int(readLine()!)! {
            case 1: print(a + b)
            case 2: print(a - b)
            case 3: print(a * b)
            case 4 where b != 0: print(a / b)
            case 4: print("Dzielenie przez zero")
            default: print("Bledny wybor. Sprobuj ponownie.")
            }
        }
    }

    static func task_5() {
        print("Podaj kod pocztowy:")
        var region: String

        switch readLine()!.first! {
        case "0": region = "mazowieckie"
        case "1": region = "warminsko-mazurskie"
        case "2": region = "lubelskie"
        case "3": region = "malopolskie"
        case "4": region = "slaskie"
        case "5": region = "dolnoslaskie"
        case "6": region = "wielkopolskie"
        case "7": region = "zachodniopomorskie"
        case "8": region = "pomorskie"
        case "9": region = "lodzkie"
        default:
            fatalError()
        }

        print("Wojewodztwo: \(region)")
    }

    static func task_6() {
        print("Podaj znak z klawiatury")
        var result: String

        switch Character(readLine()!) {
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
        let x = Int(String(pesel[pesel.index(pesel.endIndex, offsetBy: -2)]))

        switch x {
        case 1, 3, 5, 7, 9:
            print("Mezczyzna")
        default:
            print("Kobieta")
        }
    }
}