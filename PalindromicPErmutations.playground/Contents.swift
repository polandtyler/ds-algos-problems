import UIKit

class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        var oddNum = 0
        
        for (_, value) in s.frequencies where value % 2 == 1 {
            oddNum += 1
            
            if oddNum >= 2 {
                return false
            }
        }
        
        return true
    }
}

extension Sequence where Element: Hashable {
  var frequencies: [Element: Int] {
    return Dictionary(self.map{ ($0, 1)}, uniquingKeysWith: +)
  }
}
