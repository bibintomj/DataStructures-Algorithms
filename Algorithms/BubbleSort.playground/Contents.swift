

extension Array where Element: Comparable {
    mutating func sortUsingBubbleSort() {
        guard count > 1 else { return }
        var maxIndex = count - 1
        var index = 0
        while maxIndex >= 1 {
            while index < maxIndex {
                if self[index] > self[index + 1] {
                    //swap
                    let temperory = self[index]
                    self[index] = self[index + 1]
                    self[index + 1] = temperory
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

