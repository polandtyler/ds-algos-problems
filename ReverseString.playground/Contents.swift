import UIKit

func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    while left < right {
        let temp = s[left]
        left += 1
        s[left] = s[right]
        right -= 1
        s[right] = temp
    }
}
