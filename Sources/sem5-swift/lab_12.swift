import Foundation

protocol ComplexNum {
    var re: Double { get set }
    var im: Double { get set }
}

protocol RandomNum {
    func generateRandomNum() -> Int
}

class ComplexNumOperations: ComplexNum {
    var re: Double
    var im: Double

    init(re: Double, im: Double) {
        self.re = re
        self.im = im
    }

    func add(other: ComplexNumOperations) -> ComplexNumOperations {
        ComplexNumOperations(re: re + other.re, im: im + other.im)
    }

    func subtract(other: ComplexNumOperations) -> ComplexNumOperations {
        ComplexNumOperations(re: re - other.re, im: im - other.im)
    }

    func show() {
        if im < 0 {
            print("(\(re) - \(abs(im))j)")
        } else {
            print("(\(re) + \(im)j)")
        }
    }
}

class Numbers: RandomNum {
    var num1: Int = 0
    var num2: Int = 0

    init() {
        num1 = generateRandomNum()
        num2 = generateRandomNum()
    }

    func generateRandomNum() -> Int {
        Int.random(in: -20...20)
    }

    func show() {
        print(num1, num2)
    }

    func myPow(power: Int) {
        num1 = Int(pow(Double(num1), Double(power)))
        num2 = Int(pow(Double(num2), Double(power)))
    }
}

struct lab_12 {
    static func task_1() {
        let num1 = ComplexNumOperations(re: 3.5, im: -4.5)
        let num2 = ComplexNumOperations(re: -7.5, im: 5)
        let sum = num1.add(other: num2)
        let difference = num1.subtract(other: num2)
        num1.show()
        num2.show()
        sum.show()
        difference.show()
    }

    static func task_2() {
        let numbers = Numbers()
        numbers.show()
        numbers.myPow(power: 3)
        numbers.show()
    }

    static func task_3() {
        enum Calculation: Error {
            case DivisionByZero, SquareRootOfNegativeNumber
        }

        func divide(num1: Int, num2: Int) throws -> Double {
            if num2 == 0 {
                throw Calculation.DivisionByZero
            } else {
                return Double(num1) / Double(num2)
            }
        }

        func mySqrt(num: Int) throws -> Double {
            if num < 0 {
                throw Calculation.SquareRootOfNegativeNumber
            } else {
                return sqrt(Double(num))
            }
        }

        print("Podaj 1 liczbe:")
        guard let num1 = Int(readLine()!) else {
            fatalError("Bledna liczba")
        }
        print("Podaj 2 liczbe:")
        guard let num2 = Int(readLine()!) else {
            fatalError("Bledna liczba")
        }

        do {
            let divisionRes = try divide(num1: num1, num2: num2)
            print(num1, "/", num2, "=", divisionRes)
            let sqrtRes1 = try mySqrt(num: num1)
            print("sqrt(\(num1)) = \(sqrtRes1)")
            let sqrtRes2 = try mySqrt(num: num2)
            print("sqrt(\(num2)) = \(sqrtRes2)")
        } catch (Calculation.DivisionByZero) {
            print("Dzielenie przez 0")
        } catch (Calculation.SquareRootOfNegativeNumber) {
            print("Pierwiastek z ujemnej liczby")
        } catch {
            fatalError("Inny blad")
        }
    }
}