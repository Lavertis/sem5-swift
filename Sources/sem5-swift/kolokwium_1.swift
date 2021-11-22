import Foundation

struct kolokwium_1 {
    static func task_1_sub_func(tab1: [Int], tab2: [Int]) -> Int {
        var counter = 0
        for i in tab1 {
            var temp_1 = tab1
            var temp_2 = tab2

            let mean_1_before = Double(temp_1.reduce(0, +)) / Double(temp_1.count)
            let mean_2_before = Double(temp_2.reduce(0, +)) / Double(temp_2.count)

            temp_1.remove(at: temp_1.firstIndex(of: i)!)
            temp_2.append(i)

            let mean_1_after = Double(temp_1.reduce(0, +)) / Double(temp_1.count)
            let mean_2_after = Double(temp_2.reduce(0, +)) / Double(temp_2.count)

            if mean_1_after > mean_1_before && mean_2_after > mean_2_before {
                counter += 1
            }
        }
        return counter
    }

    static func task_1() {
        print("Podaj wielkosc 1 tablicy")
        guard let n1 = Int(readLine()!) else {
            fatalError("Bledna wartosc")
        }
        if n1 < 1 {
            fatalError("Bledny rozmiar tablicy")
        }

        print("Podaj wielkosc 2 tablicy")
        guard let n2 = Int(readLine()!) else {
            fatalError("Bledna wartosc")
        }
        if n2 < 1 {
            fatalError("Bledny rozmiar tablicy")
        }

        var tab1: [Int] = []
        var tab2: [Int] = []

        for _ in 1...n1 {
            tab1.append(Int.random(in: -100...100))
        }
        for _ in 1...n2 {
            tab2.append(Int.random(in: -100...100))
        }

        print(tab1)
        print(tab2)

        let counter = task_1_sub_func(tab1: tab1, tab2: tab2) + task_1_sub_func(tab1: tab2, tab2: tab1)
        print(counter)
    }

    static func task_2() {
        let tab: [Int] = [1, 2, 4, 8, 16]

        var good = true
        for idx in 1..<tab.count - 1 {
            let x: Double = Double(tab[idx - 1])
            let y: Double = Double(tab[idx])
            let z: Double = Double(tab[idx + 1])
            let res = (y == (x + z) / 2)
            if !res {
                good = false
            }
        }
        print(good)
    }
}