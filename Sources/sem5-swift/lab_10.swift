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

    static func task_3() {
        class Vector2D {
            var x: Double
            var y: Double

            init(x: Double, y: Double) {
                self.x = x
                self.y = y
            }

            func getDistanceTo(other: Vector2D) -> Double {
                hypot(x - other.x, y - other.y)
            }

            var quadrant: Int {
                if x > 0 && y > 0 {
                    return 1
                } else if x < 0 && y > 0 {
                    return 2
                } else if x < 0 && y < 0 {
                    return 3
                } else {
                    return 4
                }
            }
        }

        func getPointFromUser() -> Vector2D {
            print("Podaj X:")
            guard let x = Double(readLine()!) else {
                fatalError("Bledna wartosc X")
            }
            print("Podaj Y:")
            guard let y = Double(readLine()!) else {
                fatalError("Bledna wartosc Y")
            }
            return Vector2D(x: x, y: y)
        }

        enum PointToSquarePosition {
            case Inside, Outside, OnPerimeter
        }

        func getPointPosInRelToSquare(point: Vector2D, squareVertex: Double) -> PointToSquarePosition {
            if abs(point.x) == abs(squareVertex) && abs(point.y) <= abs(squareVertex) {
                return PointToSquarePosition.OnPerimeter
            } else if abs(point.y) == abs(squareVertex) && abs(point.x) <= abs(squareVertex) {
                return PointToSquarePosition.OnPerimeter
            } else if abs(point.x) < abs(squareVertex) && abs(point.y) < abs(squareVertex) {
                return PointToSquarePosition.Inside
            } else {
                return PointToSquarePosition.Outside
            }
        }

        print("Podaj koordynaty pierwszego punktu")
        let point1 = getPointFromUser()
        print("Podaj koordynaty drugiego punktu")
        let point2 = getPointFromUser()

        let distance = point1.getDistanceTo(other: point2)
        print(String(format: "Odleglosc miedzy punktami wynosi: %.2lf", distance))
        print("Cwiartka punktu 1:", point1.quadrant)
        print("Cwiartka punktu 2:", point2.quadrant)

        print("Podaj jedna wspolrzedna wierzcholka kwadratu")
        guard let squareVertex = Double(readLine()!) else {
            fatalError("Bledna wartosc wspolrzednej wierzcholka")
        }

        let pos1 = getPointPosInRelToSquare(point: point1, squareVertex: squareVertex)
        print("Pozycja punktu 1 wzgledem kwadratu:", pos1)
        let pos2 = getPointPosInRelToSquare(point: point2, squareVertex: squareVertex)
        print("Pozycja punktu 2 wzgledem kwadratu:", pos2)
    }
}