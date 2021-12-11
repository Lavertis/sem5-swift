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
        enum CalculationError: Error {
            case DivisionByZero, SquareRootOfNegativeNumber
        }

        func divide(num1: Int, num2: Int) throws -> Double {
            if num2 == 0 {
                throw CalculationError.DivisionByZero
            } else {
                return Double(num1) / Double(num2)
            }
        }

        func mySqrt(num: Int) throws -> Double {
            if num < 0 {
                throw CalculationError.SquareRootOfNegativeNumber
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
        } catch (CalculationError.DivisionByZero) {
            print("Dzielenie przez 0")
        } catch (CalculationError.SquareRootOfNegativeNumber) {
            print("Pierwiastek z ujemnej liczby")
        } catch {
            fatalError("Inny blad")
        }
    }

    static func task_4() {
        enum ATMError: Error {
            case InsufficientFunds, AmountTooHigh, DailyLimitExceeded, ExactAmountNotAvailable, IncorrectAmount
        }

        class Bank {
            var bills: [Int: Int] = [10: 4, 20: 8, 50: 6, 100: 3, 200: 2]
            var dailyLimit = 500
            var accountBalance = 5000

            func showInfo() {
                print("Stan konta:", accountBalance)
                print("Ilosc pieniedzy w bankomacie:", amountAvailable)
                print("Nominaly w bankomacie:", bills)
            }

            var amountAvailable: Int {
                bills.reduce(0, { $0 + $1.key * $1.value })
            }

            func exactAmountAvailable(amount: Int) -> Bool {
                var amountCpy = amount
                while amountCpy != 0 {
                    switch amountCpy {
                    case _ where amountCpy >= 200 && bills[200] != 0:
                        bills[200]! -= 1
                        amountCpy -= 200
                    case _ where amountCpy >= 100 && bills[100] != 0:
                        bills[100]! -= 1
                        amountCpy -= 100
                    case _ where amountCpy >= 50 && bills[50] != 0:
                        bills[50]! -= 1
                        amountCpy -= 50
                    case _ where amountCpy >= 20 && bills[20] != 0:
                        bills[20]! -= 1
                        amountCpy -= 20
                    case _ where amountCpy >= 10 && bills[10] != 0:
                        bills[10]! -= 1
                        amountCpy -= 10
                    default: return false
                    }
                }
                return true
            }

            func withdraw(amount: Int) throws -> Bool {
                if amount > accountBalance {
                    throw ATMError.InsufficientFunds
                }
                if amount > amountAvailable {
                    throw ATMError.AmountTooHigh
                }
                if amount > dailyLimit {
                    throw ATMError.DailyLimitExceeded
                }
                if amount % 10 != 0 || amount < 10 {
                    throw ATMError.IncorrectAmount
                }
                if !exactAmountAvailable(amount: amount) {
                    throw ATMError.ExactAmountNotAvailable
                }
                accountBalance -= amount
                dailyLimit -= amount
                return true
            }
        }

        let bank = Bank()
        bank.showInfo()
        while true {
            print("Podaj kwote do wyplaty")
            if let amount = Int(readLine()!) {
                do {
                    if try bank.withdraw(amount: amount) {
                        print("Pomyslnie wyplacono kwote")
                        bank.showInfo()
                    }
                } catch (ATMError.InsufficientFunds) {
                    print("Niewystarczajace srodki na koncie")
                } catch (ATMError.AmountTooHigh) {
                    print("Brak kwoty w bankomacie")
                } catch (ATMError.DailyLimitExceeded) {
                    print("Przekroczenie kwoty dziennego limitu")
                } catch (ATMError.ExactAmountNotAvailable) {
                    print("Brak odpowiednich nominalow")
                } catch (ATMError.IncorrectAmount) {
                    print("Bledna kwota")
                } catch {
                    fatalError("Not implemented error")
                }
            }
            print()
        }
    }
}