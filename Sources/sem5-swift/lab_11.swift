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
}