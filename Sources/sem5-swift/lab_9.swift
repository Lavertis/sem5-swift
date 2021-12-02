import Foundation

struct ComplexNumber: CustomStringConvertible {
    var re: Float
    var im: Float

    static func +(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re + rhs.re, im: lhs.im + rhs.im)
    }

    static func +=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        lhs.re += rhs.re
        lhs.im += rhs.im
    }

    static func -(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re - rhs.re, im: lhs.im - rhs.im)
    }

    static func -=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        lhs.re -= rhs.re
        lhs.im -= rhs.im
    }

    static func *(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re * rhs.re - lhs.im * rhs.im, im: lhs.im * rhs.re + lhs.re * rhs.im)
    }

    static func *=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        let newRe = lhs.re * rhs.re - lhs.im * rhs.im
        let newIm = lhs.im * rhs.re + lhs.re * rhs.im
        lhs.re = newRe
        lhs.im = newIm
    }

    var description: String {
        String(format: "(%.2f + %.2fj)", re, im)
    }
}

struct lab_9 {
    static func task_1() {
        print("Podaj 1 liczbe urojona w formacie x + yj")
        guard let input1 = readLine() else {
            fatalError("Blad")
        }
        print("Podaj 2 liczbe urojona w formacie x + yj")
        guard let input2 = readLine() else {
            fatalError("Blad")
        }

        let input1split = input1.split(separator: "+")
        let re1 = Float(input1split[0].trimmingCharacters(in: [" "]))!
        let im1 = Float(input1split[1].trimmingCharacters(in: [" ", "j"]))!

        let input2split = input2.split(separator: "+")
        let re2 = Float(input2split[0].trimmingCharacters(in: [" "]))!
        let im2 = Float(input2split[1].trimmingCharacters(in: [" ", "j"]))!

        let complexNum1 = ComplexNumber(re: re1, im: im1)
        let complexNum2 = ComplexNumber(re: re2, im: im2)

        var working = true

        while working {
            print("""
                  1 - dodawanie
                  2 - odejmowanie
                  3 - mnozenie
                  0 - wyjscie
                  """)
            guard let choice = Int(readLine()!) else {
                print("Sproboj ponownie")
                continue
            }

            switch choice {
            case 1:
                print(complexNum1, "+", complexNum2, "=", complexNum1 + complexNum2)
            case 2:
                print(complexNum1, "-", complexNum2, "=", complexNum1 - complexNum2)
            case 3:
                print(complexNum1, "*", complexNum2, "=", complexNum1 * complexNum2)
            case 0:
                working = false
            default:
                print("Sproboj ponownie")
            }
        }
    }
}