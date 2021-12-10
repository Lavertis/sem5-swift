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

    static func task_4() {
        func getIntArrayFromUser(count: Int) -> [Int] {
            var tab: [Int] = []
            for i in 1...count {
                print("Podaj \(i) element tablicy:")
                guard let num = Int(readLine()!) else {
                    fatalError("Podana wartosc nie jest liczba calkowita")
                }
                tab.append(num)
            }
            return tab
        }

        func printIntArray(arr: [Int]) {
            for el in arr {
                print(el, terminator: " ")
            }
            print()
        }

        func getMinElementWithIndex(arr: [Int]) -> (value: Int, index: Int) {
            let res = arr.enumerated().min(by: { (a, b) in a.1 < b.1 })!
            return (value: res.1, index: res.0)
        }

        func getMaxElementWithIndex(arr: [Int]) -> (value: Int, index: Int) {
            let res = arr.enumerated().max(by: { (a, b) in a.1 < b.1 })!
            return (value: res.1, index: res.0)
        }

        func swapMinMax(arr: inout [Int]) {
            let min = getMinElementWithIndex(arr: arr)
            let max = getMaxElementWithIndex(arr: arr)
            arr.swapAt(min.index, max.index)
        }

        func getArithmeticMean(arr: [Int]) -> Double {
            Double(arr.reduce(0, +)) / Double(arr.count)
        }

        print("Podaj liczbe elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Bledna liczba elementow tablicy")
        }
        if n < 1 {
            fatalError("Liczba elementow w tablicy musi byc >= 1")
        }
        var tab: [Int] = getIntArrayFromUser(count: n)
//        var tab = [30, 3, 10, 2, 9, 15, 56, 45, 25]

        printIntArray(arr: tab)
        let min = getMinElementWithIndex(arr: tab)
        let max = getMaxElementWithIndex(arr: tab)
        print("Minimalny element: \(min.value) na pozycji \(min.index)")
        print("Maksymalny element: \(max.value) na pozycji \(max.index)")
        print("Tablica po zamianie min z max:")
        swapMinMax(arr: &tab)
        printIntArray(arr: tab)
        let mean = getArithmeticMean(arr: tab)
        print(String(format: "Srednia arytmetyczna: %.2lf", mean))
    }

    static func task_5() {
        class Person: CustomStringConvertible {
            var name: String
            var surname: String
            var yearOfBirth: Int

            init(name: String, surname: String, yearOfBirth: Int) {
                self.name = name
                self.surname = surname
                self.yearOfBirth = yearOfBirth
            }

            var fullName: String {
                "\(name) \(surname)"
            }

            var age: Int {
                Calendar.current.component(.year, from: Date()) - yearOfBirth
            }

            var description: String {
                "Person{name: \(name), surname: \(surname), yearOfBirth: \(yearOfBirth), age: \(age)}"
            }

            func getAge() -> Int {
                Calendar.current.component(.year, from: Date()) - yearOfBirth
            }

            func show() {
                print("Person{name: \(name), surname: \(surname), yearOfBirth: \(yearOfBirth), age: \(age)}")
            }
        }

        let person1 = Person(name: "Elon", surname: "Musk", yearOfBirth: 1971)
        let person2 = Person(name: "Bill", surname: "Gates", yearOfBirth: 1955)

        print(person1)
        print(person2)

        if person1.age != person2.age {
            print("Mlodsza osoba to", [person1, person2].min(by: { (p1, p2) in person1.age < p2.age })!.fullName)
            print("Starsza osoba to", [person1, person2].max(by: { (p1, p2) in person1.age < p2.age })!.fullName)
        } else {
            print("Obie osoby sa w tym samym wieku")
        }
    }
}