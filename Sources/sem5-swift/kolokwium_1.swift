import Foundation

struct kolokwium_1 {

    /*
    Napisz program, ktory wczyta od uzytkownika rozna dlugosc dwoch tablic. Nastepnie wypelnij tablice losowymi
    liczbami. Ile jest mozliwosci takich, ze po przeniesieniu jednego elementu tablicy do drugiej, srednie w obu
    tablicach wzrosna?
    */
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

        let mean_1 = Double(tab1.reduce(0, +)) / Double(tab1.count)
        let mean_2 = Double(tab2.reduce(0, +)) / Double(tab2.count)

        var counter = 0
        for num in tab1 {
            if Double(num) > mean_2 && Double(num) < mean_1 {
                counter += 1
            }
        }
        for num in tab2 {
            if Double(num) > mean_2 && Double(num) < mean_1 {
                counter += 1
            }
        }
        print(counter)
    }

    /*
    Sprawdz, czy ciag jest arytmetyczny.
    */
    static func task_2() {
        let tab: [Int] = [1, 2, 4, 8, 16]

        var good = true
        for idx in 1..<tab.count - 1 {
            let x: Double = Double(tab[idx - 1])
            let y: Double = Double(tab[idx])
            let z: Double = Double(tab[idx + 1])
            let res = (y == (x + z) / 2.0)
            if !res {
                good = false
            }
        }
        print(good)
    }

    /*
    Napisz program, ktory sprawdzi, czy liczba calkowita podana przez uzytkownika jest doskonala. Liczba doskonala to
    taka, ktorej suma dzielnikow jest rowna tej liczbie (liczbami doskonalymi sa np. 1 = 1, 6 = 1 + 2 + 3).
    */
    static func task_3() {
        print("Podaj liczbe do sprawdzenia")
        guard let num = Int(readLine()!) else {
            fatalError("Blad")
        }
        if num < 1 {
            fatalError("Mniejsza od 1")
        }
        var divisorsSum = 0
        for i in 1..<num {
            if num % i == 0 {
                divisorsSum += i
            }
        }
        if num == divisorsSum {
            print("Liczba doskonala")
        } else {
            print("Liczba niedoskonala")
        }
    }

    /*
    Pensje p pracownikow w ciagu  miesiecy zostaly zapisane w postaci macierzy (p i m podaje uzytkownik, p > 2 i m > 3).
    Pensja nie moze byc mniejsza niz 2800. Napisz program, ktory wczyta dane do macierzy od uzytkownika, uwzgledniajac
    poprawnosc danych, a nastepnie wyznaczy:
    1. pracownika (pracownikow) o najwiekszych srednich zarobkach w ciagu k kolejnych miesiecy (k podaje uzytkownik)
    2. wszystkich pracownikow, ktorzy uzyskali srednie zarobki wieksze niz srednia wszystkich pracownikow
    Nalezy zapewnic poprawnosc wczytanych danych.
    */
    static func task_4() {
        print("Podaj p:")
        guard let p = Int(readLine()!) else {
            fatalError("Blad")
        }
        if p <= 2 {
            fatalError("p musi byc wieksze od 2")
        }

        print("Podaj m:")
        guard let m = Int(readLine()!) else {
            fatalError("Blad")
        }
        if m <= 3 {
            fatalError("p musi byc wieksze od 3")
        }

//        var mac: [[Int]] = []
        var mac: [[Int]] = [[3000, 3500, 5000, 6000], [3000, 4000, 5000, 6000], [30000, 4000, 5000, 7000]]

//        for y in 0..<p {
//            mac.append([])
//            for x in 0..<m {
//                print("Podaj pensje \(y + 1) pracownika za \(x + 1) miesiac:")
//                guard let salary = Int(readLine()!) else {
//                    fatalError("Bledna pensja")
//                }
//                if salary < 2800 {
//                    fatalError("Pensja nie moze byc mniejsza niz 2800")
//                }
//                mac[y].append(salary)
//            }
//        }

        print("Podaj k miesiecy:")
        guard let k = Int(readLine()!) else {
            fatalError("Blad")
        }
        if k > m {
            fatalError("k nie moze byc wieksze od m")
        }
        var averageSalaries: [Double] = []
        for y in 0..<p {
            var sum: Double = 0
            for x in 0..<k {
                sum += Double(mac[y][x])
            }
            averageSalaries.append(sum / Double(k))
        }
        print("Average salaries from k months: ", averageSalaries)
        let maxSalary = averageSalaries.max()
        var peopleWithMaxSalary: [Int] = []
        for (idx, salary) in averageSalaries.enumerated() {
            if (salary == maxSalary) {
                peopleWithMaxSalary.append(idx)
            }
        }
        print("People with max salary: ", peopleWithMaxSalary)

        var averageSalary: Double = 0
        for y in 0..<p {
            var sum: Double = 0
            for x in 0..<m {
                sum += Double(mac[y][x])
            }
            averageSalary += sum
        }
        averageSalary /= Double(m * p)
        print("Average salary of all: ", averageSalary)

        var peopleWithMoreThanAvgSalary: [Int] = []
        for (idx, salary) in averageSalaries.enumerated() {
            if (salary > averageSalary) {
                peopleWithMoreThanAvgSalary.append(idx)
            }
        }
        print("People with more than average salary", peopleWithMoreThanAvgSalary)
    }

    /*
    Napisz program, ktory wczyta od uzytkownika dwa ciagi liczb calkowitych (pierwszy znaczaco dluzszy od drugiego),
    a nastepnie sprawdzi, czy drugi z ciagow jest elementem skladowym (podciagiem) pierwszegoo. Jesli tak, prosze
    wyswietlic liczbe wystapien takiego podciagu i indeksy, od ktorych sie zaczynaja (podciagi moga sie nakladac).
    */
    static func task_5() {
        let tab1: [Int] = [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2, 3, 4, 5]
        let tab2: [Int] = [7, 8, 9]
        print(tab1)

        var indexes: [Int] = []
        for i in 0..<tab1.count {
            var good = true
            for j in 0..<tab2.count {
                if i + j > tab1.count - 1 {
                    good = false
                    break
                }
                if tab1[i + j] != tab2[j] {
                    good = false
                }
            }
            if good {
                indexes.append(i)
            }
        }
        print(indexes.count)
        print(indexes)
    }

    /*
    Napisz program, ktory przyjmie od uzytkownika 6 liczb z zakresu od 1 do 49 niepowtarzajace sie.
    Nastepnie program winien wylosowac kolejne 6 liczb z tego samego zakresu i porownac, ile liczb podanych przez
    uzytkownika zostalo wylosowane (jak w lotto).
    Dodatkowo, program powinien wylosowac liczbe ogolnie trafionych trojek, czworek, piatek i szostek wedlug
    nastepujacego schematu:
    1. Liczba trojek powinna byc liczba calkowita z zakresu 1 - 1000.
    2. Liczba czworek powinna byc liczba calkowita z zakresu 1 - 300, przy czym nie wieksza niz liczba trojek.
    3. Liczba piatek powinna byc liczba calkowita z zakresu 1 - 50, przy czym nie wieksza niz pierwiastek z sumy
    trojek i czworek.
    4. Liczba szostek powinna byc liczba nieparzysta calkowita z zakresu 1 - 5.
    Dodatkowo program powinien wyznaczyc wartosc indywidualnej wygranej wedlug nastepujacego schematu.
    Laczna pula na wygrane 2 000 000 zl
    1. Laczna pula za trafienie szesciu liczb 1 000 000 zl
    2. Za trzech liczb 20 zl dla kazdego gracza, ktory trafil.
    3. Laczna pula za trafienie pieciu liczb 80% z pozostalej czesci.
    4. Laczna pula za trafienie czterech liczb pozostala czesc.
    Idywidualna wygrana wynosi laczna pula za konkretne trafienie podzielona przez liczbe osob, ktore trafily. Wynik
    prosze podac z podkladnoscia do dwoch miejsc po przecinku.
    */
    static func task_6() {
        var userNumbers: [Int] = []
        for i in 1...6 {
            print("Podaj \(i) liczbe:")
            guard let temp = Int(readLine()!) else {
                fatalError("Blad")
            }
            if temp < 1 || temp > 49 || userNumbers.contains(temp) {
                fatalError("Liczba nie spelnia wymagan")
            }
            userNumbers.append(temp)
        }
        var generatedNumbers: [Int] = []
        for _ in 1...6 {
            var generatedNum = Int.random(in: 1...49)
            while generatedNumbers.contains(generatedNum) {
                generatedNum = Int.random(in: 1...49)
            }
            generatedNumbers.append(Int.random(in: 1...49))
        }
        var correctGuesses = 0
        for num in generatedNumbers {
            if userNumbers.contains(num) {
                correctGuesses += 1
            }
        }
        print(userNumbers, generatedNumbers, correctGuesses)

        let numberOf3 = Int.random(in: 1...1000)
        let numberOf4 = Int.random(in: 1...(300 > numberOf3 ? numberOf3 : 300))
        let sqrtOf3And4Sum = Int(sqrt(Double(numberOf3 + numberOf4)))
        let numberOf5 = Int.random(in: 1...(50 > sqrtOf3And4Sum ? sqrtOf3And4Sum : 50))
        let oddFrom1To5 = [1, 3, 5]
        let numberOf6 = oddFrom1To5[Int.random(in: 0...2)]
        print(numberOf3, numberOf4, numberOf5, numberOf6, separator: " ")

        let moneySpentOn6 = 1_000_000.0
        let moneySpentOn3 = 20.0 * (Double(numberOf6) + (correctGuesses == 3 ? 1.0 : 0.0))
        let moneySpentOn5 = (2_000_000.0 - moneySpentOn3 - moneySpentOn6) * 0.8
        var won = 0.0
        switch correctGuesses {
        case 3:
            won = 20.0
            break
        case 4:
            won = (moneySpentOn6 + moneySpentOn3 + moneySpentOn5) / (Double(numberOf4) + 1.0)
            break
        case 5:
            won = moneySpentOn5 / (Double(numberOf5) + 1.0)
            break
        case 6:
            won = 1_000_000.0 / (Double(numberOf6) + 1.0)
            break
        default:
            break
        }
        print(String(format: "Won: %.2lf", won))
    }

    /*
    Miedzynarodowy numer rachunku bankowego (IBAN) sklada sie z dwuliterowego kodu kraju, dwucyfrowej liczby kontrolnej
    oraz numeru konta bankowego, ktory moze byc dowolnej dlugosci (do 30 znakow), ale dlugosc musi byc stala dla danego
    kraju. Numer konta moze zawierac cyfry 0-9 i wielkie litery alfabetu lacinskiego A-Z.
    Napisz program, ktory wczyta n miedzynarodowych numerow rachunkow bankowych (IBAN) bez dwoch cyfr kontrolnych oraz
    wyznaczy liczby kontrolne. Program powinien umozliwic wczytanie poprawnych numerow bankowych dla krajow:
    Polski - kod: PL, liczba znakow nr konta: 28
    Niemiec - kod: DE, liczba znakow nr konta: 22
    Belgii - kod: BE, liczba znakow nr konta: 16
    Szwajcaria: kod CH, liczba znakow nr konta: 21
    Szwecja: kod SE, liczba znakow nr konta: 24
    Hiszpania: kod ES, liczba znakow nr konta: 24
    Dania: kod DK, liczba znakow nr konta: 18
    Austria: kod AT, liczba znakow nr konta: 20

    Algorytm weryfikacji numeru bankowego sklada sie z nastepujacych krokow:
    W miejsce cyfr kontrolnych (po symbolu kraju) nalezy wstawic 00
    4 pierwsze znaki sa przenoszone na koniec numeru konta.
    Litery kodu kraju nalezy zamienic na dwucyfrowe liczby: A=10, B=11, ... Y=34, Z=35.
    Otrzymana liczba jest dzielona przez 97.
    Wynik odejmowany jest od 98. Jezeli reszta z dzielenia jest jednocyfrowa, nalezy poprzedzic ja cyfra 0.
    W przeciwnym wypadku otrzymany wynik jest liczba kontrolna.

    Obliczajac reszte z dzielenia przez 97 mozna skorzystac z nastepujacego algorytmu:
    Liczba jest dzielona na mniejsze liczby.
    Obliczana jest reszta z dzielenia dla pierwszej z liczb.
    Wynik jest dopisywany do kolejnej, na poczatku. Obliczana jest reszta z dzielenia.
    Krok 3 jest powtarzany az do ostatniej liczby. Ostatnia reszta z dzielenia jest wynikiem.

    W przypadku, gdy podany numer jest poprawny, nalezy wyswietlic go z podzialem po 4 znaki (ostatnia czesc nie musi
    zawiera czterech znakow), wstawiajac spacja pomiedzy bloki. Jesli numer nie jest poprawny, nalezy wyswietlic
    odpowiedni komunikat informujacy o rodzaju bledu.

    Przyklad dzielenia modulo!
    Obliczymy nastepujaca wartosc 1295302 mod 7
    Bierzemy zatem pierwsza cyfre z lewej i wykonujemy operacje modulo: 1 mod 7 = 1
    Do wyniku z poprzedniego kroku dodajemy kolejna cyfre (2) i dzielimy modulo: 12 mod 7 = 5
    Dodajemy kolejna cyfre (9) i znow dzielimy modulo: 59 mod 7 = 3
    Do wyniku z poprzedniego kroku dodajemy kolejna cyfre (5), wykonujemy kolejna operacje modulo: 35 mod 7 = 0
    Dodajemy kolejna cyfre (3) i znow dzielimy modulo: 3 mod 7 = 3
    Dodajemy kolejna cyfre (0) i znow dzielimy modulo: 30 mod 7 = 2
    Dodajemy kolejna cyfre (2) i znow dzielimy modulo: 22 mod 7 = 1
    Zatem ostateczny wynik to: 1295302 mod 7 = 1
    */
    static func task_7() {
        let codesOriginal = ["PL10105000997603123456789123",
                             "DE75512108001245126199",
                             "BE71096123456769",
                             "CH5604835012345678009",
                             "SE7280000810340009783242",
                             "ES7921000813610123456789",
                             "DK9520000123456789",
                             "AT483200000012345864"]
        let codes = ["PL105000997603123456789123",
                     "DE512108001245126199",
                     "BE096123456769",
                     "CH04835012345678009",
                     "SE80000810340009783242",
                     "ES21000813610123456789",
                     "DK20000123456789",
                     "AT3200000012345864"]

        let code = codes[0]
        var arr = Array(code)
        print(arr)
        arr.insert("0", at: 2)
        arr.insert("0", at: 2)
        print(arr)
        arr.append(arr.remove(at: 0))
        arr.append(arr.remove(at: 0))
        arr.append(arr.remove(at: 0))
        arr.append(arr.remove(at: 0))
        print(arr)
        for i in 0..<arr.count {
            if arr[i].isUppercase {
                let temp = Array(String(arr[i].asciiValue! - 65 + 10))
                arr[i] = temp[0]
                arr.insert(temp[1], at: i + 1)
            }
        }
        print(arr)
        let str = String(arr)
        print(str)

        var temp_str = str
        var mod = ""
        while temp_str.count != 0 {
            mod += String(temp_str.removeFirst())
            mod = String(Int(mod)! % 97)
        }
        var res = String(98 - Int(mod)!)
        if res.count == 1 {
            res.insert("0", at: res.startIndex)
        }
        print(res)
        var codeFinal = code
        codeFinal.insert(contentsOf: res, at: codeFinal.index(codeFinal.startIndex, offsetBy: 2))
        print(codeFinal)

        for (idx, chr) in codeFinal.enumerated() {
            print(chr, terminator: "")
            if (idx + 1) % 4 == 0 && idx != 0 {
                print(" ", terminator: "")
            }
        }
    }

    /*
    Pobierz ilosc elementow tablicy od uzytkownika i wygeneruj ja z randomowymi wartosciami od 100 do 120.
    Nastepnie wyswietl ile razy dany element sie pojawil
    */
    static func task_8() {
        print("Podaj ilosc elementow tablicy:")
        guard let n = Int(readLine()!) else {
            fatalError("Bledne dane")
        }
        if n < 2 {
            fatalError("Zbyt mala liczba")
        }
        var tab: [Int] = []
        for _ in 1...n {
            tab.append(Int.random(in: 100...120))
        }
        var occurrences: [Int] = []
        for _ in 1...21 {
            occurrences.append(0)
        }
        for i in tab {
            occurrences[i - 100] += 1
        }
        print(tab)
        print(occurrences)
    }

    /*
    Stworz tablice dwu wymiarowa o wielkosci wygenerowanej losowo od 10 do 20 i wypelnij ja randomowymi wartosciami
    od -100 do 100, przy czym wartosci na przekatnej maja wartosc 1 lub -1 (w stosunku 50%), nastepnie wyswietl iloraz
    sumy elementow w wierszach parzystych i kolumnach nieparzytsych, ile elementow tablicy bylo mniejszych niz iloczyn
    i wierszy i j kolumn oraz wyswietl 2 najwieksze elementy w tablicy.
    */
    static func task_9() {
        var tab: [[Int]] = []
//        let size = Int.random(in: 10...20)
        let size = 6

        for y in 0..<size {
            tab.append([])
            for x in 0..<size {
                if x == y && y % 2 == 0 {
                    tab[y].append(1)
                } else if x == y && y % 2 != 0 {
                    tab[y].append(-1)
                } else {
                    tab[y].append(Int.random(in: -100...100))
                }
            }
        }
        for y in tab {
            for x in y {
                print(x, terminator: " ")
            }
            print()
        }

        var evenRowSum = 0
        var oddColSum = 0
        for y in 0..<size {
            for x in 0..<size {
                if y % 2 == 0 {
                    evenRowSum += tab[y][x]
                }
                if x % 2 != 0 {
                    oddColSum += tab[y][x]
                }
            }
        }
        print(String(format: "Iloczyn: %.2lf", Double(evenRowSum) / Double(oddColSum)))
        let rowAndColProduct = size * size
        var lessThanRowAndColProductCount = 0
        for y in tab {
            for x in y {
                if x < rowAndColProduct {
                    lessThanRowAndColProductCount += 1
                }
            }
        }
        print(String(format: "Mniejszych niz xSize * ySize: %d", lessThanRowAndColProductCount))

        var biggestNums: [Int] = [-1000, -1000]
        for y in tab {
            for x in y {
                biggestNums[0] = max(x, biggestNums[0])
            }
        }
        for y in tab {
            for x in y {
                if x != biggestNums[0] {
                    biggestNums[1] = max(x, biggestNums[1])
                }
            }
        }
        print(biggestNums)
    }

    /*
    Napisac program, ktory tworzy dwie dwuwymiarowe tablice.
    Pierwsza wypelniana jest zestawem liczb calkowitych (losowymi wartosciami) z przedzialu [-100, 200),
    ale z wyjatkiem elementow znajdujacych sie na przekatnych, ktore w ok. 25% przypadkow maja otrzymac wartosc 1,
    a w pozostalych 75% wartosc -1.
    Druga jest wypelniana zestawem wartosci 0,1 (lub true, false).
    Nastepnie nalezy wylosowac jedna liczbe z zakresu [-100, 200) i sprawdzic ile elementow pierwszej posiada wartosc
    taka sama badz wieksza niz wylosowany.
    Ponadto policzyc sume elementow, dla ktorych w odpowiednich komorkach drugiej tablicy (boolowskiej) zapisana jest
    wartosc true (1).
    */
    static func task_10() {
        var tab1: [[Int]] = []
        var tab2: [[Bool]] = []
        let ySize = 5
        let xSize = 5

        for y in 0..<ySize {
            tab1.append([])
            for x in 0..<xSize {
                if x == y && y % 4 == 0 {
                    tab1[y].append(1)
                } else if x == y && y % 4 != 0 {
                    tab1[y].append(-1)
                } else {
                    tab1[y].append(Int.random(in: -100..<200))
                }
            }
        }

        for y in tab1 {
            for x in y {
                print(x, terminator: " ")
            }
            print()
        }
        print()

        for y in 0..<ySize {
            tab2.append([])
            for x in 0..<xSize {
                tab2[y].append(Bool.random())
            }
        }

        for y in tab2 {
            for x in y {
                print(x, terminator: " ")
            }
            print()
        }
        print()

        let randomNumber = Int.random(in: -100..<200)
        var moreThanOrEqualTab1Count = 0
        for y in tab1 {
            for x in y {
                if x >= randomNumber {
                    moreThanOrEqualTab1Count += 1
                }
            }
        }
        print(moreThanOrEqualTab1Count)

        var trueValCount = 0
        for y in tab2 {
            for x in y {
                if x {
                    trueValCount += 1
                }
            }
        }
        print(trueValCount)
    }

    /*
    Napisac program, ktory wczyta lancuch znakow. Nalezy wyswietlic dlugosc lancucha (bez uzycia metody count) oraz
    liczbe (nie sume) wystepujacych w nim cyfr z przedzialu [2, 9]. Na zakonczenie program zwraca nowy lancuch,
    w ktorym cyfry z przedzialu [2, 9] zostaly zmniejszone o 2, a wszystkie pozostale znaki przepisane tylko co drugie.
    */
    static func task_11() {
        print("Podaj lancuch znakow")
        guard let str = readLine() else {
            fatalError("Blad")
        }
        var strLength = 0
        var numCount = 0
        var newStrAsArr: [String] = []
        for (idx, chr) in str.enumerated() {
            strLength += 1
            if chr.isNumber && (chr.wholeNumberValue! >= 2 && chr.wholeNumberValue! <= 9) {
                numCount += 1
                newStrAsArr.append(String(chr.wholeNumberValue! - 2))
            } else {
                if idx % 2 == 0 {
                    newStrAsArr.append(String(chr))
                }
            }
        }
        print(strLength)
        print(numCount)
        let newStr = newStrAsArr.joined(separator: "")
        print(newStr)
    }

    /*
    Wyliczyc sume liczb nieparzystych z przedzialu pobranego od uzytkownika.
    */
    static func task_12() {

    }

    /*
    Utworzyc tablice 25x25. Pierwsza polowe wypelnic 1, druga 2.
    Podzielic kolumne 15 na 2. Obliczyc sume, pomiedzy wierszami 13-19 i kolumnami 11-17 (czesc wspolna)
    */
    static func task_13() {

    }

    /*
    Scalic 2 ciagi liczb calkowitych w jeden i posortowac ich w ciag stale malejacy
    */
    static func task_14() {

    }

    /*
    Notowania listy przebojow dla p piosenek w ciagu d dni przechowywane sa w macierzy, w ktorej wiersze reprezentuja
    kolejne numery piosenek, a kolumny zawieraja uzyskane miejsce na liscie piosenki w danym dniu. Napisz program,
    ktory wypelni wylosowanymi danymi macierz w postaci liczb calkowitych reprezentujacych pozycje na liscie przebojow.
    W kazdej kolumnie nalezy zapewnic wystapienie przynajmniej p/2 pierwszych pozycji.
    Pozycje powinny byc z zakresu [1-p].
    Wyznacz numer piosenki, ktora odnotowala najwyzszy spadek (dzienny) w ciagu d dni.
    Wyznacz numer piosenki, ktora odnotowala najwyzszy wzrost (dzienny) w ciagu d dni.
    Nalezy zapewnic poprawnosc wczytanych danych.
    */
    static func task_15() {

    }

    /*
    Wczytac liczbe elementow zmiennoprzecinkowych (p, p<30), nastepnie elementy i wypisac ilosc zmian znakow
    (z ujemnej na dodatnia i odwrotnie) elementy rowne 0 pomijac.
    */
    static func task_16() {

    }
}