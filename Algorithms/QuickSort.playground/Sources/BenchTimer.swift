import Foundation
import QuartzCore


public final class BenchTimer {
    @inline(__always) public static func measureBlock(executionCount: UInt = 1,
                                                      block: () -> Void) -> CFTimeInterval {

        var totalExecutionTime: Double = 0

        for _ in 0..<executionCount {
            let startTime = CACurrentMediaTime()
            block()
            let endTime = CACurrentMediaTime()
            totalExecutionTime += startTime - endTime
        }
        let averageExecutionTime = totalExecutionTime / Double(executionCount)
        return averageExecutionTime
    }
}

public extension CFTimeInterval {
    var formattedTime: String {
        if self >= 1000 { return String(Int (self)) + "s" }
        else if self >= 1 { return String(format: "%.3gs", self) }
        else if self >= 1e-3 { return String(format: "%.3gms", self * 1e3) }
        else if self >= 1e-6 { return String(format: "%.3gµs", self * 1e6) }
        else if self < 1e-9 { return "Os" }
        else { return String(format: "%.3gns", self * 1e9) }
    }
}
