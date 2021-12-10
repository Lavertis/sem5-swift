import Foundation

struct lab_11 {
    static func task_1() {
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

        let rect = Rectangle(a: 3.5, b: 4.5)
        print(rect)
        rect.show()
    }
}