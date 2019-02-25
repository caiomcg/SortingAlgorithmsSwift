import Foundation // File IO

extension String { 
    func toUrl() -> URL {
        return URL(fileURLWithPath: (NSString(string: self).expandingTildeInPath))
    }
}

func dumpToFile(_ arr: [Int64], with name: String) throws {
    let output: String = arr.map({ String($0) }).joined(separator: "\n") // Prepare sorted array to be dumped on the file
    print("Dumping to: \(name)\n")
    try? output.write(to: name.toUrl(), atomically: true, encoding: .utf8);
}

jumper: do {
    guard CommandLine.arguments.count >= 3 else {
        print("Invalid amount of argumenst!\n")
        print("Usage: SortingAlgorithmsSwift [FILE_PATH] [ALGORITHM]")
        print("Example: SortingAlgorithmsSwift ./instances/num.1000.1.in S")
        break jumper
    }

    let file = CommandLine.arguments[1]
    let algorithms = Set(CommandLine.arguments[2])

    let arr: [Int64] = try String(contentsOf: file.toUrl())
    .components(separatedBy: "\n").filter({ !$0.isEmpty }).map { Int64($0)! } // Grab data from file and convert to an array of 64 bit integers

    // MARK: Run all algorithms
    
    if algorithms.contains("S") {
        print("Executing Selection Sort")

        let start = DispatchTime.now()

        let res = arr.selectionSort {
            $0 > $1
        }
        
        print("Concluded the execution after: \(Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000)")

        try dumpToFile(res, with: file.replacingOccurrences(of: ".in", with: ".selection.out"))
    }

    if algorithms.contains("I") {
        print("Executing Insertion Sort")

        let start = DispatchTime.now()

        let res = arr.insertionSort {
            $0 > $1
        }
        
        print("Concluded the execution after: \(Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000)")

        try dumpToFile(res, with: file.replacingOccurrences(of: ".in", with: ".insertion.out"))
    }
} catch {
    print(error)
}
