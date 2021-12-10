import Foundation

struct lab_11 {
    class Rectangle {
        var a: Double
        var b: Double

        init(a: Double, b: Double) {
            self.a = a
            self.b = b
        }

        func calculateArea() -> Double {
            a * b
        }

        func calculatePerimeter() -> Double {
            (a + b) * 2
        }

        func show() {
            print("Rectangle{a: \(a), b: \(b), area: \(calculateArea()), perimeter: \(calculatePerimeter())}")
        }
    }

    static func task_1() {
        let rect = Rectangle(a: 3.5, b: 4.5)
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

        override func calculatePerimeter() -> Double {
            super.calculatePerimeter() * 2 + 4 * h
        }

        func calculateVolume() -> Double {
            super.calculateArea() * h
        }

        override func show() {
            print("Cuboid{a: \(a), b: \(b), h: \(h), area: \(calculateArea()), perimeter: \(calculatePerimeter()), volume: \(calculateVolume())}")
        }
    }

    static func task_2() {
        let cub = Cuboid(a: 3.5, b: 4.5, h: 6)
        cub.show()
    }

    class Person {
        var name: String
        var surname: String
        var yearOfBirth: Int

        init(name: String, surname: String, yearOfBirth: Int) {
            self.name = name
            self.surname = surname
            self.yearOfBirth = yearOfBirth
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

        func calculateMean() -> Double {
            marks.reduce(0.0, +) / Double(marks.count)
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
            print("Studenci znajdujacy sie na kierunku \(fieldOfStudy):")
            let filteredStudents = arr.filter({ s in s.fieldOfStudy == fieldOfStudy })
            if filteredStudents.count == 0 {
                print("Brak")
            } else {
                for student in filteredStudents {
                    student.show()
                    print()
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
            s.show()
            print()
        }

        showStudentsInGivenStudyField(arr: students)
    }

    class StudentOnErasmus: Student {
        var abroadUniName: String
        var erasmusStartDate: Int
        var erasmusEndDate: Int
        var courses: [String: Double]

        init(name: String, surname: String, yearOfBirth: Int, index: String, fieldOfStudy: FieldOfStudy, marks: [Double],
             abroadUniName: String, erasmusStartDate: Int, erasmusEndDate: Int, courses: [String: Double]) {
            self.abroadUniName = abroadUniName
            self.erasmusStartDate = erasmusStartDate
            self.erasmusEndDate = erasmusEndDate
            self.courses = courses
            super.init(name: name, surname: surname, yearOfBirth: yearOfBirth, index: index, fieldOfStudy: fieldOfStudy, marks: marks)
        }

        func getErasmusTime() -> Int {
            erasmusEndDate - erasmusStartDate
        }

        func getCoursesMean() -> Double {
            courses.reduce(0.0, { $0 + $1.value }) / Double(courses.count)
        }

        func getGrade() -> String {
            let mean = getCoursesMean()
            switch mean {
            case 4.6...5.0: return "bardzo dobra"
            case 3.6...4.5: return "dobra"
            case 3.0...3.5: return "dostateczna"
            case 2.0..<3.0: return "niedostateczna"
            default: fatalError("Bledna srednia")
            }
        }

        override func show() {
            super.show()
            print("""
                  ErasmusDetails{uniName: \(abroadUniName), startDate: \(erasmusStartDate),
                  endDate: \(erasmusEndDate), erasmusTime: \(getErasmusTime()) years,
                  grade: \(getGrade()), coursesMean: \(getCoursesMean())
                  courses: \(courses)
                  """)
        }
    }

    static func task_4() {
        let erasmusStudent = StudentOnErasmus(
                name: "Bill",
                surname: "Gates",
                yearOfBirth: 1955,
                index: "24685",
                fieldOfStudy: .ComputerScience,
                marks: [3.5, 4.5, 4, 5, 5],
                abroadUniName: "Univeristy of Liverpool",
                erasmusStartDate: 2018,
                erasmusEndDate: 2021,
                courses: ["Maths": 2, "Python": 5, "C++": 4.5, "Linux": 4]
        )

        erasmusStudent.show()
    }
}