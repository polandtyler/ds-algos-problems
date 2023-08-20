import UIKit

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNum = 0
        for idx in 0..<nums.count {
            if nums[idx] != 0 {
                nums.swapAt(lastNum, idx)
                lastNum += 1
            }
        }
    }
}

var nums1 = [0,1,0,3,12]
var nums2 = [0]

Solution().moveZeroes(&nums1)
Solution().moveZeroes(&nums2)

print(nums1)
print(nums2)


