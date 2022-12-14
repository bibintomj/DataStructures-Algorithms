

extension Array where Element: Comparable {
    // Complexity -
    mutating func sortUsingMergeSort() {
        guard count > 1 else { return }
        let midIndex = (endIndex - startIndex) / 2
        var firstHalf = Array(self[startIndex...midIndex-1])
        var secondHalf = Array(self[(midIndex)...])
        print(firstHalf, secondHalf)

        if firstHalf.count > 1 {
            firstHalf.sortUsingMergeSort()

        }
        if secondHalf.count > 1 {
            secondHalf.sortUsingMergeSort()
        }
        print(firstHalf, secondHalf)


        var combinedArray: Array<Element> = []

        while !firstHalf.isEmpty && !secondHalf.isEmpty {
            if firstHalf.first! <= secondHalf.first! {
                combinedArray.append(firstHalf.removeFirst())
            } else {
                combinedArray.append(secondHalf.removeFirst())
            }
        }

        if !firstHalf.isEmpty {
            combinedArray += firstHalf
        }
        if !secondHalf.isEmpty {
            combinedArray += secondHalf
        }
        self = combinedArray
    }
}

var array = [9,8,7,6,5,4,3,2,1]
array.sortUsingMergeSort()
print(array)




