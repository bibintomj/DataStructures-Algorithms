


extension ArraySlice where Element: Comparable {
    // Complexity
    // Worst Case - O(n^2)
    // Average & Best case - O(n log n)
    mutating func sortUsingQuickSort() {
        guard count > 1 else { return }
        var pivotIndex = endIndex - 1
        var currentIndex = startIndex
        while currentIndex < pivotIndex {
            let pivot = self[pivotIndex]
            let current = self[currentIndex]

            if current > pivot {
                swapAt(currentIndex, pivotIndex - 1)
                swapAt(pivotIndex, pivotIndex - 1)
                pivotIndex -= 1
            } else {
                currentIndex += 1
            }

            if pivotIndex == currentIndex {
                pivotIndex -= 1
                currentIndex = startIndex
            }
        }

        if pivotIndex >= 2 && startIndex > pivotIndex {
            self[startIndex...pivotIndex-1].sortUsingQuickSort()
        }
        if pivotIndex <= count - 3 {
            self[pivotIndex+1...endIndex-1].sortUsingQuickSort()
        }

    }
}

extension Array where Element: Comparable {
    mutating func sortUsingQuickSort() {
        self[startIndex...].sortUsingQuickSort()
    }
}

var array = [9,8,7,6,5,4,3,2,1]
let time  = BenchTimer.measureBlock {
    array.sortUsingQuickSort()
}
print(array, time)

