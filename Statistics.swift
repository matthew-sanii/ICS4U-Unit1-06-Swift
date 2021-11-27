





var list = [Int]()



func mean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

func calculateMedian(array: [Int]) -> Float {
    let sorted = array.sorted()
    if sorted.count % 2 == 0 {
        return Float((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
    } else {
        return Float(sorted[(sorted.count - 1) / 2])
    }
}


