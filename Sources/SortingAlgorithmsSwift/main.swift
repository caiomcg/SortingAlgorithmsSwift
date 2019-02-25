import Foundation // File IO

extension String { 
    func toUrl() -> URL {
        return URL(fileURLWithPath: (NSString(string: self).expandingTildeInPath))
    }
}

func usage() {
    print("\u{001B}[1;37mNAME\u{001B}[0;0m")
    print("        SortingAlgorithmsSwift - Sorting algorithms written in Swift.")
    print("\u{001B}[1;37mSYNOPSIS\u{001B}[0;0m")
    print("        SortingAlgorithmsSwift [INPUT_FILE] [ALGORITHM]")
    print("\u{001B}[1;37mDESCRIPTION\u{001B}[0;0m")
    print("        Sort a file with the specified sorting algorithm.")
    print("        [INPUT_FILE]")
    print("            File to be sorted" )
    print("        [ALGORITHM]")
    print("            Sort with the specified algorith:" )
    print("            S - Selection Sort" )
    print("            I - Insertion Sort" )
    print("\u{001B}[1;37mEXIT STATUS\u{001B}[0;0m")
    print("        0 - If ok")
    print("        1 - If a problem occured")
    print("\u{001B}[1;37mUSE EXAMPLE\u{001B}[0;0m")
    print("        \u{001B}[1;35mSorting input.txt SI\u{001B}[0;0m")
}

func dumpToFile(_ arr: [Int64], with name: String) throws {
    let output: String = arr.map({ String($0) }).joined(separator: "\n") // Prepare sorted array to be dumped on the file
    print("Dumping to: \(name)\n")
    try? output.write(to: name.toUrl(), atomically: true, encoding: .utf8);
}

jumper: do {
    guard CommandLine.arguments.count >= 3 else {
        usage()
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
