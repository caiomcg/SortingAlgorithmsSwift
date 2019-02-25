extension Array {
    func insertionSort(with comparator: (Element, Element) -> Bool) -> [Element] {
        var copy = self
        let arraySize = self.count
        
        for position in stride(from: 0, to: arraySize, by: 1) {
            let currentValue = copy[position];
            var swapperPosition = position - 1

            while swapperPosition >= 0 && comparator(copy[swapperPosition], currentValue) {
                copy[swapperPosition + 1] = copy[swapperPosition]

                swapperPosition -= 1
            }

            copy[swapperPosition + 1] = currentValue
        }
        
        return copy
    }
}