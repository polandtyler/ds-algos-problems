import UIKit

class Solution {
    func minCut(_ s: String) -> Int {
        guard s.count > 1, s.count <= 2000 else { return 0 }
        let lowercaseString = s.lowercased()
        
        let uniqueCharsCount = Set(s)
        var cutCount = 0
        
        
        return 2
    }
}

let solution = Solution()
print(solution.minCut("aab")) // 1
print(solution.minCut("a")) // 0
print(solution.minCut("ab")) // 1
