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
            for i in 2...Int(sqrt(Double(x))) {
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
        if num < 100 && num >= 0 {
            fatalError("Liczba nie jest trzycyfrowa")
        } else if num < 0 {
            fatalError("Liczba jest ujemna")
        }

        var sum = 0
        var count = 0
        while num != 0 {
            sum += num % 10
            num = num / 10
            count += 1
        }
        let mean = Double(sum) / Double(count)
        print(String(format: "%.2lf", mean))
    }

    static func task_6() {
        guard let text = readLine() else {
            fatalError()
        }
        var palindrome = true

        for (c1, c2) in zip(text, text.reversed()) {
            if c1 != c2 {
                palindrome = false
                break
            }
        }

        if palindrome {
            print("\(text) jest palindromem")
        } else {
            print("\(text) nie jest palindromem")
        }

    }

    static func task_7() {
        var sum = 0
        var i = 0
        while i <= 7 {
            if i % 2 != 0 {
                print(i)
                sum += i
            }
            i += 1
        }
        print("Suma elementow wynosi \(sum)")
    }
}