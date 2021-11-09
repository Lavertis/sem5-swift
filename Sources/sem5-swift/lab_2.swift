import Foundation

struct lab_2 {
    static func task1() {
        let currentYear = 2021
        print("Podaj rok urodzenia:")
        let userInput = readLine()!
        if let birthYear = Int(userInput) {
            let age = currentYear - birthYear
            print("Masz \(age) lat")
        }
    }

    static func task2() {
        let PI = Double.pi
        print("Podaj promien kola:")
        let userInput = readLine()!
        if let radius = Double(userInput) {
            let circumference = 2 * PI * radius
            let surfaceArea = PI * pow(radius, 2)
            let str = String(format: "Promien: %.2lf\nObwod: %.2lf\nPole: %.2lf", radius, circumference, surfaceArea)
            print(str)
        }
    }

    static func task3() {
        print("Podaj dlugosc boku szescianu:")
        let userInput = readLine()!
        if let sideLength = Double(userInput) {
            let totalSurfaceArea = 6 * pow(sideLength, 2)
            let volume = pow(sideLength, 3)
            let str = String(format: "Dlugosc boku: %.2lf\nPowierzchnia calkowita: %.2lf\nObjetosc: %.2lf",
                    sideLength, totalSurfaceArea, volume)
            print(str)
        }
    }

    static func task4() {
        print("Podaj cene listwy za metr biezacy:")
        let pricePerMeter = Double(readLine()!)!
        print("Podaj dlugosc pokoju:")
        let roomLength = Double(readLine()!)!
        print("Podaj szerokosc pokoju:")
        let roomWidth = Double(readLine()!)!
        print("Podaj dlugosc korytarza:")
        let hallwayLength = Double(readLine()!)!
        print("Podaj szerokosc korytarza:")
        let hallwayWidth = Double(readLine()!)!
        print("Podaj szerokosc drzwi:")
        let doorWidth = Double(readLine()!)!

        let finalLength = (roomLength + hallwayLength) * 2.0 + (roomWidth + hallwayWidth) * 2.0 - doorWidth * 2.0
        let finalPrice = finalLength * pricePerMeter
        print(String(format: "Metrow biezacych: %.2lf", finalLength))
        print(String(format: "Cena: %.2lf", finalPrice))
    }

    static func task5() {
        let n = 3
        var sum = 0
        var numbers: [Int] = []

        for _ in 1...n {
            let num = Int.random(in: 1...9)
            sum += num
            numbers.append(num)
        }

        print(numbers)
        print("Srednia: \(Double(sum) / Double(n))")
    }

    static func task6() {
        print("Zostaniesz poproszony o podanie 3 ocen wraz z ich wagami (od 1 do 3)")
        var totalSum = 0
        var weightSum = 0

        for i in 1...3 {
            print("Podaj ocene \(i):")
            let grade = Int(readLine()!)!
            print("Podaj wage oceny \(i):")
            let weight = Int(readLine()!)!
            totalSum += grade * weight
            weightSum += weight
        }
        let res = Double(totalSum) / Double(weightSum)
        print(String(format: "Srednia wazona: %.2lf", res))
    }
}