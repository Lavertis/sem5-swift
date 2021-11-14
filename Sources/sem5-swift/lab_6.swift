import Foundation

struct lab_6 {
    static func task_1() {
        let tab: [Float] = Array(repeating: 1.0, count: 12)
        for i in tab {
            print(i)
        }
    }

    static func task_2() {
        var tab: [Int] = Array(repeating: 6, count: 10)
        print("Podaj liczbe calkowita:")
        guard let num = Int(readLine()!) else {
            fatalError("Podana bledna wartosc")
        }
        tab[0] = num
        tab[Int.random(in: 1...9)] = num
        tab.forEach {
            print($0, terminator: " ")
        }
    }

    static func task_3() {
        print("Podaj liczbe elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Podana wielkosc nie jest liczba calkowita")
        }
        if n < 1 {
            fatalError("Liczba elementow tablicy musi byc dodatnia")
        }

        var tab: [Int] = []
        for index in 1...n {
            print("Podaj \(index) element tablicy:")
            guard let num = Int(readLine()!) else {
                fatalError("Podany element nie jest liczba calkowita")
            }
            tab.append(num)
        }

        print("Podaj liczbe do sprawdzenia:")
        guard let num = Int(readLine()!) else {
            fatalError("Podana liczba nie jest calkowita")
        }

        if tab.first == num {
            print("Podana liczba jest pierwszym elementem tablicy")
        }
        if tab.last == num {
            print("Podana liczba jest ostatnim elementem tablicy")
        }
        if tab.first != num && tab.last != num {
            print("Podana liczba nie jest pierwszym ani ostatnim elementem tablicy")
        }

        tab.forEach {
            print($0, terminator: " ")
        }
    }

    static func task_4() {
        print("Podaj liczbe elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Podana wielkosc nie jest liczba calkowita")
        }
        if n < 1 {
            fatalError("Liczba elementow tablicy musi byc dodatnia")
        }

        var tab1: [Int] = []
        for index in 1...n {
            print("Podaj \(index) element pierwszej tablicy:")
            guard let num = Int(readLine()!) else {
                fatalError("Podany element nie jest liczba calkowita")
            }
            tab1.append(num)
        }

        var tab2: [Int] = []
        for index in 1...n {
            print("Podaj \(index) element pierwszej tablicy:")
            guard let num = Int(readLine()!) else {
                fatalError("Podany element nie jest liczba calkowita")
            }
            tab2.append(num)
        }

        tab1.sort()
        tab2.sort()

        if tab1 == tab2 {
            print("Tablice zawieraja identyczne elementy")
        } else {
            print("Tablice zawieraja rozne elementy")
        }
    }

    static func task_5() {
        print("Podaj liczbe elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Podana wielkosc nie jest liczba calkowita")
        }
        if n < 1 {
            fatalError("Liczba elementow tablicy musi byc dodatnia")
        }

        var tab: [Float] = []
        for index in 1...n {
            print("Podaj \(index) element tablicy:")
            guard let num = Float(readLine()!) else {
                fatalError("Podany element nie jest zmiennoprzecinkowy")
            }
            tab.append(num)
        }

        print("Minimalna wartosc: \(tab.min()!)")
        print("Maksymalna wartosc: \(tab.max()!)")
    }

    static func task_6() {
        print("Podaj liczbe elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Podana wielkosc nie jest liczba calkowita")
        }
        if n < 1 {
            fatalError("Liczba elementow tablicy musi byc dodatnia")
        }
        var tab: [Int] = []
        for index in 1...n {
            print("Podaj \(index) element tablicy:")
            guard let num = Int(readLine()!) else {
                fatalError("Podany element nie jest liczba calkowita")
            }
            tab.append(num)
        }

        var startIndex = 0
        var maxLength = 1
        var currentStartIndex = 0
        var currentLength = 1

        for i in 1..<tab.count {
            if tab[i - 1] < tab[i] {
                currentLength += 1
            } else {
                currentStartIndex = i
                currentLength = 1
            }

            if currentLength > maxLength {
                startIndex = currentStartIndex
                maxLength = currentLength
            }
        }

        if maxLength == 1 {
            print("Brak ciagu rosnacego")
        } else {
            print("Indeks poczatkowy ciagu: \(startIndex)")
            print("Dlugosc ciagu: \(maxLength)")
            for index in startIndex..<startIndex + maxLength {
                print(tab[index], terminator: " ")
            }
            print()
        }
    }

    static func task_7() {
        let matrix: [[Int]] = [[10, 20, 30], [40, 50, 60]]
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                print("\(matrix[i][j])", terminator: " ")
            }
            print()
        }
    }

    static func task_8() {
        print("Podaj liczbe wierszy:")
        guard let rows = Int(readLine()!) else {
            fatalError("Liczba wierszy musi byc liczba calkowita")
        }
        if rows < 1 {
            fatalError("Liczba wierszy musi byc wieksza od 0")
        }

        print("Podaj liczbe kolumn:")
        guard let cols = Int(readLine()!) else {
            fatalError("Liczba kolumn musi byc liczba calkowita")
        }
        if cols < 1 {
            fatalError("Liczba kolumn musi byc wieksza od 0")
        }

        var matrix: [[Int]] = []
        var maxRowIndex = 0
        var maxRowSum = 0
        for y in 0..<rows {
            var row: [Int] = []
            for x in 0..<cols {
                print("Podaj \(x + 1) element w \(y + 1) wierszu")
                guard let num = Int(readLine()!) else {
                    fatalError("Podany element nie jest liczba calkowita")
                }
                row.append(num)
            }
            matrix.append(row)
            let rowSum = row.reduce(0, +)
            if rowSum > maxRowSum {
                maxRowIndex = y + 1
                maxRowSum = rowSum
            }
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                print("\(matrix[i][j])", terminator: " ")
            }
            print()
        }

        print("Najwieksza suma")
        print("Wiersz: \(maxRowIndex)")
        print("Wartosc elementow: \(maxRowSum)")
    }
}