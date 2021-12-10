import Foundation

struct lab_11 {
    class Rectangle: CustomStringConvertible {
        var a: Double
        var b: Double

        init(a: Double, b: Double) {
            self.a = a
            self.b = b
        }

        var area: Double {
            a * b
        }

        func calculateArea() -> Double {
            a * b
        }

        var perimeter: Double {
            (a + b) * 2
        }

        func calculatePerimeter() -> Double {
            (a + b) * 2
        }

        var description: String {
            "Rectangle{a: \(a), b: \(b), area: \(area), perimeter: \(perimeter)}"
        }

        func show() {
            print("Rectangle{a: \(a), b: \(b), area: \(calculateArea()), perimeter: \(calculatePerimeter())}")
        }
    }

    static func task_1() {
        let rect = Rectangle(a: 3.5, b: 4.5)
        print(rect)
        rect.show()
    }

    class Cuboid: Rectangle {
        var h: Double

        init(a: Double, b: Double, h: Double) {
            self.h = h
            super.init(a: a, b: b)
        }

        override func calculateArea() -> Double {
            super.calculateArea() * 2 + 2 * (a * h) + 2 * (b * h)
        }

        override var area: Double {
            super.area * 2 + 2 * (a * h) + 2 * (b * h)
        }

        override func calculatePerimeter() -> Double {
            super.calculatePerimeter() * 2 + 4 * h
        }

        override var perimeter: Double {
            super.perimeter * 2 + 4 * h
        }

        func calculateVolume() -> Double {
            super.calculateArea() * h
        }

        var volume: Double {
            super.area * h
        }

        override var description: String {
            "Cuboid{a: \(a), b: \(b), h: \(h), area: \(area), perimeter: \(perimeter), volume: \(volume)}"
        }

        override func show() {
            print("Cuboid{a: \(a), b: \(b), h: \(h), area: \(calculateArea()), perimeter: \(calculatePerimeter()), volume: \(calculateVolume())}")
        }
    }

    static func task_2() {
        let cub = Cuboid(a: 3.5, b: 4.5, h: 6)
        print(cub)
        cub.show()
    }

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
            print("Person{name: \(name), surname: \(surname), yearOfBirth: \(yearOfBirth), age: \(getAge())}")
        }
    }

    class Student: Person {
        enum FieldOfStudy {
            case ComputerScience, BiomedicalEngineering, Mechatronics
        }

        var index: String
        var fieldOfStudy: FieldOfStudy
        var marks: [Double]

        init(name: String, surname: String, yearOfBirth: Int, index: String, fieldOfStudy: FieldOfStudy, marks: [Double]) {
            self.index = index
            self.fieldOfStudy = fieldOfStudy
            self.marks = marks
            super.init(name: name, surname: surname, yearOfBirth: yearOfBirth)
        }

        var mean: Double {
            marks.reduce(0.0, +) / Double(marks.count)
        }

        func calculateMean() -> Double {
            marks.reduce(0.0, +) / Double(marks.count)
        }

        override var description: String {
            """
            Student{name: \(name), surname: \(surname), yearOfBirth: \(yearOfBirth), age: \(age),
            index: \(index), fieldOfStudy: \(fieldOfStudy),
            marks: \(marks), mean: \(mean)}
            """
        }

        override func show() {
            print("""
                  Student{name: \(name), surname: \(surname), yearOfBirth: \(yearOfBirth), age: \(getAge()),
                  index: \(index), fieldOfStudy: \(fieldOfStudy),
                  marks: \(marks), mean: \(calculateMean())}
                  """)
        }
    }

    static func task_3() {
        func getFieldOfStudyFromUser() -> Student.FieldOfStudy {
            print("""
                  1 - Computer Science
                  2 - Biomedical Engineering
                  3 - Mechatronics
                  """)
            guard let fieldOfStudyAsInt = Int(readLine()!) else {
                fatalError("Bledny numer kierunku studiow")
            }
            switch fieldOfStudyAsInt {
            case 1:
                return Student.FieldOfStudy.ComputerScience
            case 2:
                return Student.FieldOfStudy.BiomedicalEngineering
            case 3:
                return Student.FieldOfStudy.Mechatronics
            default:
                fatalError("Bledny numer kierunku studiow")
            }
        }

        func getStudentFromUser() -> Student {
            print("Podaj imie studenta:")
            let name = readLine()!
            print("Podaj nazwisko studenta:")
            let surname = readLine()!
            print("Podaj rok urodzenia studenta:")
            guard let yearOfBirth = Int(readLine()!) else {
                fatalError("Bledna data urodzenia")
            }
            print("Podaj numer indeksu studenta:")
            let index = readLine()!
            print("Wybierz kierunek studiow studenta:")
            let fieldOfStudy = getFieldOfStudyFromUser()
            print("Podaj oceny studenta")
            var marks: [Double] = []
            for i in 1...5 {
                print("Podaj \(i) ocene studenta:")
                guard let mark = Double(readLine()!) else {
                    fatalError("Bledna ocena")
                }
                switch mark {
                case 2, 3, 3.5, 4, 4.5, 5: marks.append(mark)
                default:fatalError("Bledna ocena")
                }
            }
            return Student(name: name, surname: surname, yearOfBirth: yearOfBirth, index: index, fieldOfStudy: fieldOfStudy, marks: marks)
        }

        func getStudentsFromUser(count: Int) -> [Student] {
            var students: [Student] = []
            for i in 1...count {
                print("Podaj dane \(i) studenta")
                let student = getStudentFromUser()
                students.append(student)
                print()
            }
            return students
        }

        func showStudentsInGivenStudyField(arr: [Student]) {
            print("Wybierz kierunek studiow do wyszukania")
            let fieldOfStudy = getFieldOfStudyFromUser()
            print("Studenci znajdujacy sie na podanym kierunku:")
            let filteredStudents = arr.filter({ s in s.fieldOfStudy == fieldOfStudy })
            if filteredStudents.count == 0 {
                print("Brak")
            } else {
                for student in filteredStudents {
                    print(student, terminator: "\n\n")
                }
            }
        }

        print("Podaj liczbe studentow:")
        guard let studentsCount = Int(readLine()!) else {
            fatalError("Bledna liczba studentow")
        }
        if studentsCount < 1 {
            fatalError("Liczba studentow nie moze byc mniejsza niz 1")
        }
        let students: [Student] = getStudentsFromUser(count: studentsCount)

//        let students = [
//            Student(name: "Elon", surname: "Musk", yearOfBirth: 1977, index: "24365", fieldOfStudy: .ComputerScience, marks: [3.5, 4.5, 4, 5, 5]),
//            Student(name: "Bill", surname: "Gates", yearOfBirth: 1955, index: "12345", fieldOfStudy: .ComputerScience, marks: [3.5, 3, 3.5, 4, 2]),
//            Student(name: "Jeff", surname: "Bezos", yearOfBirth: 1964, index: "34562", fieldOfStudy: .BiomedicalEngineering, marks: [5, 5, 4.5, 4.5, 5]),
//            Student(name: "Donald", surname: "Trump", yearOfBirth: 1946, index: "54975", fieldOfStudy: .Mechatronics, marks: [3, 3.5, 3, 3.5, 3.5])
//        ]

        print("Wszyscy studenci:")
        for s in students {
            print(s, terminator: "\n\n")
        }

        showStudentsInGivenStudyField(arr: students)
    }
}