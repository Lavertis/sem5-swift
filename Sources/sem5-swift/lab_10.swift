import Foundation

struct lab_10 {
    static func task_1() {
        func min(numbers: [Int]) -> Int {
            let min = numbers.min()!
            print("Smallest number:", min)
            return min
        }

        func max(numbers: [Int]) -> Int {
            let max = numbers.max()!
            print("Biggest number:", max)
            return max
        }

        func min_max(numbers: [Int]) -> (min: Int, max: Int) {
            let max = numbers.max()!
            let min = numbers.min()!
            print("Min:", min, "Max:", max)
            return (min, max)
        }

        var randomNumbers: [Int] = []
        for _ in 1...3 {
            randomNumbers.append(Int.random(in: 0...100))
        }
        print(randomNumbers)
        _ = max(numbers: randomNumbers)
        _ = min(numbers: randomNumbers)
        _ = min_max(numbers: randomNumbers)
    }
}