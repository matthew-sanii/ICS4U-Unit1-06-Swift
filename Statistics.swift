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

//let home = FileManager.default.homeDirectoryForCurrentUser

//let fileUrl = home
//    .appendingPathComponent("test")
//    .appendingPathExtension("txt")

guard FileManager.default.fileExists(atPath: fileUrl.path) else {
    preconditionFailure("File expected at \(fileUrl.absoluteString) is missing.")
}

//open the file for reading
guard let filePointer:UnsafeMutablePointer<FILE> = fopen(fileUrl.path,"r") else { preconditionFailure("Could not open file at \(fileUrl.absoluteString)")
}

var lineByteArrayPointer: UnsafeMutablePointer<CChar>? = nil

var lineCap: Int = 0

var bytesRead = getline(&lineByteArrayPointer,&lineCap, filePointer)

defer {
fclose(filePointer)
}

while (bytesRead > 0) {
    let lineAsString = String.init(cString:lineByteArrayPointer!)
    print (lineAsString)
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

exit(0)


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
