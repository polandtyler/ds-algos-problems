import UIKit

class Solution {
    func fibonacci(_ n: Int) -> [Int] {
        var num1 = 0
        var num2 = 1

        for _ in 0 ..< n {
        
            let num = num1 + num2
            num1 = num2
            num2 = num
        }
        
        print("result = \(num2)")
    }
    
    func fibRecursive(_ n: Int) -> Int {
        guard n != 0, n != 1 else { return n }
        return fibRecursive(n - 1) + fibRecursive(n - 2)
    }
}

print(Solution().fibonacci(7))
print(Solution().fibRecursive(10))
