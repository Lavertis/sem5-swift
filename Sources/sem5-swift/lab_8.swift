import Foundation

struct lab_8 {
    static func task_1() {
        let person1 = (name: "Elon", surname: "Musk", yearOfBirth: 1971)
        let person2 = (name: "Bill", surname: "Gates", yearOfBirth: 1955)

        if person1.yearOfBirth < person2.yearOfBirth {
            print("Older person is \(person1.name) \(person1.surname)")
        } else if person1.yearOfBirth > person2.yearOfBirth {
            print("Older person is \(person2.name) \(person2.surname)")
        } else {
            print("Both persons are the same age:")
            print(person1.name, person1.surname)
            print(person2.name, person2.surname)
        }
    }

    static func task_2() {
        var student: (surname: String, marks: [Float])
        var students: [(surname: String, marks: [Float])] = []
//        students = [("Musk", [3.0, 4.0, 5.0]), ("Gates", [3, 3.5, 3]), ("Jobs", [4.5, 4.5, 5.0])]

        for i in 1...3 {
            print("Podaj nazwisko", i, "studenta:")
            guard let surname = readLine() else {
                fatalError("Error")
            }
            var marks: [Float] = []
            for j in 1...3 {
                print("Podaj", j, "ocene", i, "studenta:")
                guard let mark = Float(readLine()!) else {
                    fatalError("Error")
                }
                marks.append(mark)
            }
            student.surname = surname
            student.marks = marks
            students.append(student)
        }

        students.sort(by: { $0.marks.reduce(0.0, +) / 3.0 > $1.marks.reduce(0.0, +) / 3.0 })
        for s in students {
            print(String(format: "%@ %.2lf", s.surname, s.marks.reduce(0.0, +) / 3.0))
        }
    }

    static func task_3() {
        var flats: [(location: String, area: Float, pricePerM2: Float)] = []
//        flats = [("1", 3000, 3000), ("2", 200, 200),("3", 50000, 50000)]

        print("Podaj liczbe mieszkan:")
        guard let flatCount = Int(readLine()!) else {
            fatalError("Blad")
        }

        for i in 1...flatCount {
            print("Podaj lokalizacje", i, "mieszkania:")
            guard let location = readLine() else {
                fatalError("Blad")
            }
            print("Podaj powierzchnie", i, "mieszkania:")
            guard let area = Float(readLine()!) else {
                fatalError("Blad")
            }
            print("Podaj cene za M2", i, "mieszkania:")
            guard let pricePerM2 = Float(readLine()!) else {
                fatalError("Blad")
            }
            flats.append((location, area, pricePerM2))
        }

        let mostExpensive = flats.max(by: { $0.area * $0.pricePerM2 < $1.area * $1.pricePerM2 })!
        let cheapest = flats.min(by: { $0.area * $0.pricePerM2 < $1.area * $1.pricePerM2 })!
        print("Most expensive flat:", mostExpensive.location, mostExpensive.area, mostExpensive.pricePerM2)
        print("Cheapest flat:", cheapest.location, cheapest.area, cheapest.pricePerM2)
    }

    static func task_4() {
        enum Month {
            case January, February, March, April, May, June, July, August, September, October, November, December
        }

        let month = Month.January
        switch month {
        case .March, .April, .May:
            print("Spring")
        case .June, .July, .August:
            print("Summer")
        case .September, .October, .November:
            print("Autumn")
        case .December, .January, .February:
            print("Winter")
        }
    }

    static func task_5() {
        enum Standard {
            case High, Medium, Low
        }

        var flats: [(location: String, area: Float, pricePerM2: Float, standard: Standard)] = []
//        flats = [("1", 3000, 3000, Standard.Medium), ("2", 200, 200, Standard.Low), ("3", 50000, 50000, Standard.High)]

        print("Podaj liczbe mieszkan:")
        guard let flatCount = Int(readLine()!) else {
            fatalError("Blad")
        }

        for i in 1...flatCount {
            print("Podaj lokalizacje", i, "mieszkania:")
            guard let location = readLine() else {
                fatalError("Blad")
            }
            print("Podaj powierzchnie", i, "mieszkania:")
            guard let area = Float(readLine()!) else {
                fatalError("Blad")
            }
            print("Podaj cene za M2", i, "mieszkania:")
            guard let pricePerM2 = Float(readLine()!) else {
                fatalError("Blad")
            }
            print("Podaj standard", i, "mieszkania (1 - niski, 2 - sredni, 3 - wysoki):")
            guard let standardAsInt = Int(readLine()!) else {
                fatalError("Blad")
            }
            var standard: Standard
            switch standardAsInt {
            case 1:
                standard = .Low
            case 2:
                standard = .Medium
            case 3:
                standard = .High
            default:
                fatalError("Blad")
            }
            flats.append((location, area, pricePerM2, standard))
        }

        let expensive = flats.max(by: { $0.area * $0.pricePerM2 < $1.area * $1.pricePerM2 })!
        let cheapest = flats.min(by: { $0.area * $0.pricePerM2 < $1.area * $1.pricePerM2 })!
        print("Most expensive flat:", expensive.location, expensive.area, expensive.pricePerM2, expensive.standard)
        print("Cheapest flat:", cheapest.location, cheapest.area, cheapest.pricePerM2, cheapest.standard)
    }
}