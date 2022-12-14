
/**

 Binary search seeks to find the target in a sorted array by dividing the sequence in haf, and looking in the half where the target might be in.

 */

extension ArraySlice where Element: Comparable {
    // Complexity - O(log n)
    func findViaBinarySearch(target: Element) -> Int? {
        guard !self.isEmpty else { return nil }

        let midIndex = startIndex + ((endIndex - startIndex) / 2)
        let middleElement = self[midIndex]
        if middleElement == target { return midIndex }
        else if target > middleElement {
            if midIndex + 1 <= endIndex {
                return self[(midIndex + 1)...].findViaBinarySearch(target: target)
            }
            else { return nil }
        } else if target < middleElement {
            if midIndex - 1 >= startIndex {
                return self[startIndex...midIndex - 1].findViaBinarySearch(target: target)
            }
            else { return nil }
        } else {
            return nil
        }
    }
}


//func monitorTime(for process: () -> Void) {
//    do {
//        print("Begin Monitoring")
//        var info = mach_timebase_info(numer: 0, denom: 0)
//        mach_timebase_info(&info)
//        let begin = mach_absolute_time()
//        process()
//        let diff = Double(mach_absolute_time() - begin) * Double(info.numer) / Double(info.denom)
//        print("Took \(diff) seconds to run")
//        print("End Monitoring")
//
//    }
//}


let array = [1,2,3,4,5,6,7,8,9]


//monitorTime {
let index = array[array.startIndex...].findViaBinarySearch(target: 9)
print(index)
//}

//monitorTime {
//    print(array.firstIndex(where: { val in
//        val == 9
//    }))
//}

