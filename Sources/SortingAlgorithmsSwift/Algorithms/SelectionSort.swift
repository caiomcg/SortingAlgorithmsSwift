extension Array {
    func selectionSort(with comparator: (Element, Element) -> Bool) -> [Element]{
        var copy = self
        let arraySize = self.count

        for position in stride(from: 0, to: arraySize - 1, by: 1) {
            var lowerPosition = position;

            for checkIfLower in stride(from: position + 1, to: arraySize, by: 1) {
                if (comparator(copy[lowerPosition], copy[checkIfLower])) {
                    lowerPosition = checkIfLower
                }
            }

            copy.swapAt(position, lowerPosition)
        }
        
        return copy
    }
}
