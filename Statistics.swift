/*
* The BoardFoot program, designed to find the length of a board based
* on height and width given.
*
* @author  Matthew Sanii
* @version 1.0
* @since   2021-24-11
*/

import Foundation

// Get the file path/filename from the command line. Needs to be provided after "-path"
guard let path = UserDefaults.standard.string(forKey: "path") else {
    print("Path not provided.")
    exit(1)
}

let fileUrl = URL(fileURLWithPath: path)
print(fileUrl)

guard FileManager.default.fileExists(atPath: fileUrl.path) else {
    preconditionFailure("File expected at \(fileUrl.absoluteString) is missing.")
}

// open the file for reading
guard let filePointer: UnsafeMutablePointer<FILE> = fopen(fileUrl.path, "r") else {
    preconditionFailure("Could not open file at \(fileUrl.absoluteString)")
}

var lineByteArrayPointer: UnsafeMutablePointer<CChar>?
var lineCap: Int = 0
var bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)

defer {
fclose(filePointer)
}

var list = [Int]()

while bytesRead > 0 {
    let lineAsString = String.init(cString: lineByteArrayPointer!)
    let value = Int((lineAsString).trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
    list.append(value)
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print(list)
print(mean(numbers: list))
print(calculateMedian(array: list))

func mean(numbers: [Int]) -> Int {
    var total: Int = 0
    for number in numbers {
        total += number
    }
    return total / Int(numbers.count)
}

func calculateMedian(array: [Int]) -> Float {
    let sorted = array.sorted()
    if sorted.count % 2 == 0 {
        return Float((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1]) / 2)
    } else {
        return Float(sorted[(sorted.count - 1) / 2])
    }
}
