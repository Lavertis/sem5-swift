import Foundation

struct ComplexNumber: CustomStringConvertible {
    var re: Float
    var im: Float

    static func +(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re + rhs.re, im: lhs.im + rhs.im)
    }

    static func +=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        lhs.re += rhs.re
        lhs.im += rhs.im
    }

    static func -(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re - rhs.re, im: lhs.im - rhs.im)
    }

    static func -=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        lhs.re -= rhs.re
        lhs.im -= rhs.im
    }

    static func *(lhs: ComplexNumber, rhs: ComplexNumber) -> ComplexNumber {
        ComplexNumber(re: lhs.re * rhs.re - lhs.im * rhs.im, im: lhs.im * rhs.re + lhs.re * rhs.im)
    }

    static func *=(lhs: inout ComplexNumber, rhs: ComplexNumber) {
        let newRe = lhs.re * rhs.re - lhs.im * rhs.im
        let newIm = lhs.im * rhs.re + lhs.re * rhs.im
        lhs.re = newRe
        lhs.im = newIm
    }

    var description: String {
        String(format: "(%.2f + %.2fj)", re, im)
    }
}

struct lab_9 {
    static func task_1() {
        print("Podaj 1 liczbe urojona w formacie x + yj")
        guard let input1 = readLine() else {
            fatalError("Blad")
        }
        print("Podaj 2 liczbe urojona w formacie x + yj")
        guard let input2 = readLine() else {
            fatalError("Blad")
        }

        let input1split = input1.split(separator: "+")
        let re1 = Float(input1split[0].trimmingCharacters(in: [" "]))!
        let im1 = Float(input1split[1].trimmingCharacters(in: [" ", "j"]))!

        let input2split = input2.split(separator: "+")
        let re2 = Float(input2split[0].trimmingCharacters(in: [" "]))!
        let im2 = Float(input2split[1].trimmingCharacters(in: [" ", "j"]))!

        let complexNum1 = ComplexNumber(re: re1, im: im1)
        let complexNum2 = ComplexNumber(re: re2, im: im2)

        var working = true

        while working {
            print("""
                  1 - dodawanie
                  2 - odejmowanie
                  3 - mnozenie
                  0 - wyjscie
                  """)
            guard let choice = Int(readLine()!) else {
                print("Sproboj ponownie")
                continue
            }

            switch choice {
            case 1:
                print(complexNum1, "+", complexNum2, "=", complexNum1 + complexNum2)
            case 2:
                print(complexNum1, "-", complexNum2, "=", complexNum1 - complexNum2)
            case 3:
                print(complexNum1, "*", complexNum2, "=", complexNum1 * complexNum2)
            case 0:
                working = false
            default:
                print("Sproboj ponownie")
            }
        }
    }

    static func task_2() {
        struct javelinThrow: CustomStringConvertible {
            var contestantId: Int
            var attempts: [Float]

            var description: String {
                String(format: "Contestant{id: %d, attempts: %@}", contestantId, attempts.description)
            }
        }

        var participants: [javelinThrow] = []
        participants = [
            javelinThrow(contestantId: 1, attempts: [7.8, 9.6, 8.6]),
            javelinThrow(contestantId: 2, attempts: [13.45, 28.39, 17.98]),
            javelinThrow(contestantId: 3, attempts: [11.79, 12.22, 10.2])
        ]

//        for p in 1...4 {
//            print("Podaj ID", p, "zawodnika:")
//            guard let id = Int(readLine()!) else {
//                fatalError("Blad")
//            }
//            var `throws`: [Float] = []
//            for t in 1...3 {
//                print("Podaj", t, "rzut", p, "zawodnika:")
//                guard let `throw` = Float(readLine()!) else {
//                    fatalError("Blad")
//                }
//                `throws`.append(`throw`)
//            }
//            participants.append(javelinThrow(contestantId: id, attempts: `throws`))
//        }

        var maxThrowAvg: Float = 0.0
        var maxThrowAvgIdx = 0
        var minThrowAvg: Float = Float.greatestFiniteMagnitude
        var minThrowAvgIdx = 0

        for (idx, participant) in participants.enumerated() {
            let avg = participant.attempts.reduce(0.0, +) / 3
            if avg > maxThrowAvg {
                maxThrowAvg = avg
                maxThrowAvgIdx = idx
            }
            if avg < minThrowAvg {
                minThrowAvg = avg
                minThrowAvgIdx = idx
            }
        }

        print("Best participant:", participants[maxThrowAvgIdx])
        participants.remove(at: minThrowAvgIdx)
        print("Without worst participant:")
        for p in participants {
            print(p)
        }
    }

    static func task_3() {
        var cars = Set<String>()
//        cars = ["Acura", "Alfa Romeo", "Bentley", "Buick", "Cadillac", "Chevrolet"]

        for i in 1...6 {
            print("Podaj", i, "model samochodu:")
            if let model = readLine() {
                cars.insert(model)
            }
        }

        print("Podaj model samochodu do usuniecia:")
        let model = readLine()!

        if let removedItem = cars.remove(model) {
            print("Usunieto", removedItem)
        } else {
            print("Brak podanego modelu w zbiorze")
        }
    }
}