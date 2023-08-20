import UIKit


extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class Solution {
    // intuition: sounds like a stack problem
    func findBuildings(_ heights: [Int]) -> [Int] {
        // build a stack
        var stack: [Int] = []

        // for every (index, element) in the array
        for (index, height) in heights.enumerated() {
            // create an index for the last element on the stack
            if let i = stack.last,
                    // and if the height at that index is bigger than our current one
                    height >= heights[i] {
                // pop it off the stack
                stack.removeLast()
            }
            // otherwise, push the element onto the stack
            stack.append(index)
        }
        // and then return the stack
        return stack
    }
}

print(Solution().findBuildings([4,2,3,1]))
print(Solution().findBuildings([4,3,2,1]))
print(Solution().findBuildings([1,3,2,4]))
