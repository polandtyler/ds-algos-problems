import UIKit

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var numberCounts = [Int: Int]()
        for i in 0..<nums.count {
            let numberInQuestion = nums[i]
            if numberCounts[numberInQuestion] == nil {
                numberCounts[numberInQuestion] = 1
            } else {
                numberCounts[numberInQuestion]! += 1
            }
        }
        
        return numberCounts.filter { $0.value == 1 }.first!.key
    }
}

print(Solution().singleNumber([4,1,2,1,2]))
