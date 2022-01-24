import Foundation

struct kolokwium_2 {
    static func animals() {
        class TypZwierzecia {
            enum ZwierzeTyp {
                case Kregowce, Bezkregowce
            }

            var imie: String
            var waga: Float
            var wzrost: Int
            var rokUrodzenia: Int
            var id: Int
            var typ: ZwierzeTyp

            init(imie: String, waga: Float, wzrost: Int, rokUrodzenia: Int, id: Int, typ: ZwierzeTyp) {
                self.imie = imie
                self.waga = waga
                self.wzrost = wzrost
                self.rokUrodzenia = rokUrodzenia
                self.id = id
                self.typ = typ
            }

            func getWiek() -> Int {
                let obecnyRok = Calendar.current.component(.year, from: Date())
                return obecnyRok - rokUrodzenia
            }

            func show() {
                print("TypZwierzecia{")
                print("Imie: \(imie)")
                print("Waga: \(waga)")
                print("Wzrost: \(wzrost)")
                print("Rok urodzenia: \(rokUrodzenia)")
                print("ID: \(id)")
                print("Typ: \(typ)")
                print("}")
            }
        }

        class Zwierze: TypZwierzecia {
            enum Gromada {
                case Ptaki, Ssaki, Plazy, Gady, Pajeczaki
            }

            var gromada: Gromada
            var liczbaKonczyn: Int
            var maxPozywienie: Int
            var minPowierzchnia: Float
            var karmienia: [(godzinaKarmienia: Int, iloscPokarmu: Int)]

            init(imie: String, waga: Float, wzrost: Int, rokUrodzenia: Int, id: Int, typ: TypZwierzecia.ZwierzeTyp,
                 gromada: Gromada, liczbaKonczyn: Int, maxPozywienie: Int, minPowierzchnia: Float,
                 karmienia: [(godzinaKarmienia: Int, iloscPokarmu: Int)]) {
                self.gromada = gromada
                self.liczbaKonczyn = liczbaKonczyn
                self.maxPozywienie = maxPozywienie
                self.minPowierzchnia = minPowierzchnia
                self.karmienia = karmienia
                super.init(imie: imie, waga: waga, wzrost: wzrost, rokUrodzenia: rokUrodzenia, id: id, typ: typ)
            }

            override func show() {
                print("Zwierze{")
                super.show()
                print("Gromada: \(gromada)")
                print("Liczba konczyn: \(liczbaKonczyn)")
                print("Max pozywienie: \(maxPozywienie)")
                print("Min powierzchnia: \(minPowierzchnia)")
                print("Karmienie: \(karmienia)")
                print("}")
            }

            func updatePokarmDlaGodziny(godzinaKarmienia: Int, nowaIloscPokarmu: Int) {
                guard let index = karmienia.firstIndex(where: { $0.godzinaKarmienia == godzinaKarmienia }) else {
                    print("Podana godzina karmienia nie istnieje")
                    return
                }

                let sum = karmienia.reduce(0, { $0 + $1.iloscPokarmu })
                if sum - karmienia[index].iloscPokarmu + nowaIloscPokarmu > maxPozywienie {
                    print("Nowa wartosc pokarmu rzekroczylaby maksymalna ilosc dziennego wymaganego pozywienia")
                    return
                }

                karmienia[index].iloscPokarmu = nowaIloscPokarmu
            }
        }

        class Zoo {
            var zwierzeta: [Zwierze]

            init(zwierzeta: [Zwierze]) {
                self.zwierzeta = zwierzeta
            }

            func showAllAnimals() {
                for zwierze in zwierzeta {
                    zwierze.show()
                }
            }

            func showKregowce() {
                for zwierze in zwierzeta where zwierze.typ == TypZwierzecia.ZwierzeTyp.Kregowce {
                    zwierze.show()
                }
            }

            func showBezkregowce() {
                for zwierze in zwierzeta where zwierze.typ == TypZwierzecia.ZwierzeTyp.Bezkregowce {
                    zwierze.show()
                }
            }

            func showNajstarsze() {
                guard let oldestAnimal = zwierzeta.min(by: { z1, z2 in z1.rokUrodzenia < z2.rokUrodzenia }) else {
                    print("Brak zwierzat")
                    return
                }
                let year = oldestAnimal.rokUrodzenia
                for zwierze in zwierzeta where zwierze.rokUrodzenia == year {
                    zwierze.show()
                }
            }

            func showNajmlodszze() {
                guard let youngestAnimal = zwierzeta.max(by: { z1, z2 in z1.rokUrodzenia < z2.rokUrodzenia }) else {
                    print("Brak zwierzat")
                    return
                }
                let year = youngestAnimal.rokUrodzenia
                for zwierze in zwierzeta where zwierze.rokUrodzenia == year {
                    zwierze.show()
                }
            }

            func getZwierze(id: Int) -> Zwierze? {
                zwierzeta.first(where: { zwierze in zwierze.id == id })
            }

            func getPoraKarmieniaWithin(within: Int, aktualnaPora: Int) {
                for zwierze in zwierzeta {
                    for karmienie in zwierze.karmienia {
                        let diff = karmienie.godzinaKarmienia - aktualnaPora
                        if diff <= within && diff >= 0 {
                            zwierze.show()
                            break
                        }
                    }
                }
            }

            func updateIloscPozywienia(entries: [(id: Int, godzina: Int, ilosc: Int)]) {
                for entry in entries {
                    guard let index = zwierzeta.firstIndex(where: { zwierze in zwierze.id == entry.id }) else {
                        print("Brak zwierzeta o podanym id")
                        continue
                    }
                    zwierzeta[index].updatePokarmDlaGodziny(godzinaKarmienia: entry.godzina, nowaIloscPokarmu: entry.ilosc)
                }
            }
        }

        let animal1 = Zwierze(
                imie: "Zwierze 1",
                waga: 80,
                wzrost: 90,
                rokUrodzenia: 2000,
                id: 1,
                typ: TypZwierzecia.ZwierzeTyp.Kregowce,
                gromada: Zwierze.Gromada.Gady,
                liczbaKonczyn: 2,
                maxPozywienie: 1000,
                minPowierzchnia: 10.5,
                karmienia: [
                    (godzinaKarmienia: 8, iloscPokarmu: 384),
                    (godzinaKarmienia: 12, iloscPokarmu: 128),
                    (godzinaKarmienia: 18, iloscPokarmu: 256)
                ]
        )
        let animal2 = Zwierze(
                imie: "Zwierze 2",
                waga: 100.5,
                wzrost: 50,
                rokUrodzenia: 1990,
                id: 2,
                typ: TypZwierzecia.ZwierzeTyp.Bezkregowce,
                gromada: Zwierze.Gromada.Plazy,
                liczbaKonczyn: 4,
                maxPozywienie: 800,
                minPowierzchnia: 38.23,
                karmienia: [
                    (godzinaKarmienia: 8, iloscPokarmu: 384),
                    (godzinaKarmienia: 12, iloscPokarmu: 128),
                    (godzinaKarmienia: 18, iloscPokarmu: 256)
                ]
        )
        let animal3 = Zwierze(
                imie: "Zwierze 3",
                waga: 12.5,
                wzrost: 6,
                rokUrodzenia: 1995,
                id: 3,
                typ: TypZwierzecia.ZwierzeTyp.Kregowce,
                gromada: Zwierze.Gromada.Pajeczaki,
                liczbaKonczyn: 8,
                maxPozywienie: 30,
                minPowierzchnia: 1.5,
                karmienia: [
                    (godzinaKarmienia: 8, iloscPokarmu: 384),
                    (godzinaKarmienia: 12, iloscPokarmu: 128),
                    (godzinaKarmienia: 18, iloscPokarmu: 256)
                ]
        )

        let animals = [animal1, animal2, animal3]

        print("========== Plazy ==========")
        let plazy = animals.filter { animal in
            animal.gromada == Zwierze.Gromada.Plazy
        }
        if plazy.isEmpty {
            print("Brak plazow")
        } else {
            for plaz in plazy {
                plaz.show()
                print()
            }
        }

        print("\n========== Przed zmiana karmienia ==========")
        print(animals[0].karmienia)

        print("\n========== Po zmianie karmienia ==========")
        animals[0].updatePokarmDlaGodziny(godzinaKarmienia: 12, nowaIloscPokarmu: 500)
        animals[0].updatePokarmDlaGodziny(godzinaKarmienia: 12, nowaIloscPokarmu: 100)
        print(animals[0].karmienia)

        let zoo = Zoo(zwierzeta: animals)

        print("\n========== Dane wszystkich zwierzat w zoo ==========")
        zoo.showAllAnimals()

        print("\n========== Najmlodsze zwierzeta ==========")
        zoo.showNajmlodszze()

        print("\n========== Najstarsze zwierzeta ==========")
        zoo.showNajstarsze()

        print("\n========== Get zwierze by id ==========")
        zoo.getZwierze(id: 2)?.show()

        print("\n========== Zwierzeta z pora karmienia w ciagu X godzin ==========")
        zoo.getPoraKarmieniaWithin(within: 3, aktualnaPora: 9)

        print("\n========== Zmiana ilosci pozywienia ==========")
        zoo.updateIloscPozywienia(entries: [
            (id: 1, godzina: 12, ilosc: 333),
            (id: 2, godzina: 18, ilosc: 111),
        ])
        zoo.showAllAnimals()
    }
}