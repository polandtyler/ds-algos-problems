import UIKit

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count != 0 else { return 0}
        let sortedNumbers = nums.sorted()
        
        var longestStreak = 1
        var currentStreak = 1
        
        for index in 1..<sortedNumbers.count {
            if sortedNumbers[index] != sortedNumbers[index-1] {
                print(index-1)
                if sortedNumbers[index] == sortedNumbers[index-1]+1 {
                    currentStreak += 1
                }
                else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        
        return max(longestStreak, currentStreak)
    }
}

let solution = Solution()
print(solution.longestConsecutive([100,4,200,1,3,2])) // 4
print(solution.longestConsecutive([0,3,7,2,5,8,4,6,0,1])) // 9
