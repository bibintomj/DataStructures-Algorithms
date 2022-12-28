

extension Array where Element: Comparable {
    // Complexity - O(n^2) - Spcae Efficiency is O(1) used for swapping
    mutating func sortUsingBubbleSort() {
        guard count > 1 else { return }
        var maxIndex = count - 1
        var index = 0
        while maxIndex >= 1 {
            while index < maxIndex {
                if self[index] > self[index + 1] {
                    swapAt(index, index + 1)
                }
                index += 1
            }
            index = 0
            maxIndex -= 1
        }
    }
}

var array = [9,8,7,6,5,4,3,2,1]
array.sortUsingBubbleSort()
print(array)

