import Foundation

struct lab_10 {
    static func task_1() {
        func min(numbers: [Int]) -> Int {
            let min = numbers.min()!
            print("Smallest number:", min)
            return min
        }

        func max(numbers: [Int]) -> Int {
            let max = numbers.max()!
            print("Biggest number:", max)
            return max
        }

        func min_max(numbers: [Int]) -> (min: Int, max: Int) {
            let max = numbers.max()!
            let min = numbers.min()!
            print("Min:", min, "Max:", max)
            return (min, max)
        }

        var randomNumbers: [Int] = []
        for _ in 1...3 {
            randomNumbers.append(Int.random(in: 0...100))
        }
        print(randomNumbers)
        _ = max(numbers: randomNumbers)
        _ = min(numbers: randomNumbers)
        _ = min_max(numbers: randomNumbers)
    }

    static func task_2() {
        func add() {
            let nums = getTwoDoubles()
            let res = nums.0 + nums.1
            if nums.1 >= 0 {
                print("\(nums.0) + \(nums.1) = \(res)")
            } else {
                print("\(nums.0) - \(-nums.1) = \(res)")
            }
        }

        func subtract() {
            let nums = getTwoDoubles()
            let res = nums.0 - nums.1
            if nums.1 >= 0 {
                print("\(nums.0) - \(nums.1) = \(res)")
            } else {
                print("\(nums.0) + \(-nums.1) = \(res)")
            }
        }

        func multiply() {
            let nums = getTwoDoubles()
            let res = nums.0 * nums.1
            print("\(nums.0) * \(nums.1) = \(res)")
        }

        func divide() {
            let nums = getTwoDoubles()
            if nums.1 == 0.0 {
                fatalError("Division by 0")
            }
            let res = nums.0 / nums.1
            print(String(format: "%.2lf / %.2lf = %.3lf", nums.0, nums.1, res))
        }

        func squareRoot() {
            let num = getOneDouble()
            if num < 0 {
                fatalError("The square root of a negative number does not exist")
            }
            let res = sqrt(num)
            print(String(format: "sqrt(%.2lf) = %.3lf", num, res))
        }

        func getTwoDoubles() -> (num1: Double, num2: Double) {
            print("Podaj pierwsza liczbe zmiennoprzecinkowa:")
            guard let num1 = Double(readLine()!) else {
                fatalError("Not a number entered")
            }
            print("Podaj druga liczbe zmiennoprzecinkowa:")
            guard let num2 = Double(readLine()!) else {
                fatalError("Not a number entered")
            }
            return (num1, num2)
        }

        func getOneDouble() -> Double {
            print("Podaj liczbe zmiennoprzecinkowa:")
            guard let num = Double(readLine()!) else {
                fatalError("Not a number entered")
            }
            return num
        }

        func showMenu() {
            print("""
                  1 - dodawanie
                  2 - odejmowanie
                  3 - mnozenie
                  4 - dzielenie
                  5 - pierwiastkowanie
                  0 - wyjscie
                  """)
        }

        func actionSwitcher(action: Int?, loop: inout Bool) {
            switch action {
            case 1: add()
            case 2: subtract()
            case 3: multiply()
            case 4: divide()
            case 5: squareRoot()
            case 0: loop = false
            default: print("Wrong menu entry. Try again.")
            }
        }

        var loop = true
        while loop {
            showMenu()
            let choice: Int? = Int(readLine()!)
            actionSwitcher(action: choice, loop: &loop)
        }
    }
}