import Foundation

protocol LiczbaZespolona {
    var re: Double { get set }
    var im: Double { get set }
}

class OperacjeNaLiczbachZespolonych: LiczbaZespolona {
    var re: Double
    var im: Double

    init(re: Double, im: Double) {
        self.re = re
        self.im = im
    }

    func dodaj(other: OperacjeNaLiczbachZespolonych) -> OperacjeNaLiczbachZespolonych {
        OperacjeNaLiczbachZespolonych(re: re + other.re, im: im + other.im)
    }

    func odejmij(other: OperacjeNaLiczbachZespolonych) -> OperacjeNaLiczbachZespolonych {
        OperacjeNaLiczbachZespolonych(re: re - other.re, im: im - other.im)
    }

    func show() {
        if im < 0 {
            print("(\(re) - \(abs(im))j)")
        } else {
            print("(\(re) + \(im)j)")
        }
    }
}

struct lab_12 {
    static func task_1() {
        let num1 = OperacjeNaLiczbachZespolonych(re: 3.5, im: -4.5)
        let num2 = OperacjeNaLiczbachZespolonych(re: -7.5, im: 5)
        let sum = num1.dodaj(other: num2)
        let difference = num1.odejmij(other: num2)
        num1.show()
        num2.show()
        sum.show()
        difference.show()
    }
}