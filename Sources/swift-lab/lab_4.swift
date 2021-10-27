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

        print(points)
    }
}