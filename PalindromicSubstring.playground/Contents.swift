import UIKit

class Solution {
    /// O(n)^3
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 2 else { return s }
        
        var maxLength = 0
        var longestPalindrome = ""
        for start in s.indices {
            var end = s.index(after: start)
            while end != s.endIndex {
                let p = s[start..<end]
                if p == String(p.reversed()) {
                    if p.count > maxLength {
                        maxLength = p.count
                        longestPalindrome = String(p)
                    }
                }
                end = s.index(after: end)
            }
        }
        return longestPalindrome
    }


    func longestPalindromeSub(_ s: String) -> String {
        var maxLen = 0
        var maxStart: String.Index = s.startIndex
        
        func expand(left: String.Index, right: String.Index) -> (start: String.Index, len: Int) {
            var len = 0
            var l = left, r = right
            
            while r != s.endIndex && s[l] == s[r] {
                if l != r {
                    len += 2
                } else {
                  len += 1
                }
                
                if (l == s.startIndex) {
                    return (l, len)
                } else {
                    l = s.index(before: l)
                }
                r = s.index(after: r)
            }
            return (s.index(after: l), len)
        }
        
        func updateMax(t:(start: String.Index, len: Int)) {
            if t.len > maxLen {
                maxLen = t.len
                maxStart = t.start
            }
        }
        
        for position in s.indices {
            updateMax(t: expand(left: position, right: position))
            updateMax(t: expand(left: position, right: s.index(after: position)))
        }
        
        return String(s[maxStart..<s.index(maxStart, offsetBy: maxLen)])
    }
}

Solution().longestPalindromeSub("aabbab") == "abba"
Solution().longestPalindromeSub("aabab") == "aba"
Solution().longestPalindromeSub("babababcd") == "bababab"
Solution().longestPalindrome("abc") == "a"
Solution().longestPalindrome("a") == "a"
Solution().longestPalindrome("") == ""
Solution().longestPalindrome("bananas") == "anana"
Solution().longestPalindrome("banana") == "ana"
