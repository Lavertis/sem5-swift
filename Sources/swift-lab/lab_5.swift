import Foundation

struct lab_5 {
    static func task_1() {
        for i in 1...25 {
            print(i, terminator: " ")
        }
        print()

        var i = 1
        while i <= 25 {
            print(i, terminator: " ")
            i += 1
        }
        print()

        i = 1
        repeat {
            print(i, terminator: " ")
            i += 1
        } while i <= 25
    }

    static func task_2() {
        for i in stride(from: 1, through: 25, by: 3) {
            print(i, terminator: " ")
        }
        print()

        var i = 1
        while i <= 25 {
            print(i, terminator: " ")
            i += 3
        }
        print()

        i = 1
        repeat {
            print(i, terminator: " ")
            i += 3
        } while i <= 25
        print()
    }

    static func task_3() {
        guard let max = Int(readLine()!) else {
            fatalError()
        }

        var num1 = 1, num2 = 1
        while num1 <= max {
            print(num1, terminator: " ")
            let temp = num2
            num2 = num1 + num2
            num1 = temp
        }
    }

    static func task_4() {
        guard let x = Int(readLine()!) else {
            fatalError()
        }

        var isPrime = true
        if (x == 0 || x == 1) {
            isPrime = false
        } else {
            for i in 2...x {
                if (x % i == 0) {
                    isPrime = false
                    break
                }
            }
        }

        if isPrime {
            print("\(x) is a prime number")
        } else {
            print("\(x) is not a prime number")
        }
    }

    static func task_5() {
        guard var num = Int(readLine()!) else {
            fatalError()
        }
        if num < 100 {
            fatalError("Liczba nie jest trzycyfrowa")
        }

        var sum = 0
        while num != 0 {
            sum += num % 10
            num = num / 10
        }
        print(sum)
    }

    static func task_6() {
        
    }
}