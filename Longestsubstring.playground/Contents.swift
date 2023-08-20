import UIKit

func lenOfLongestSubstring(s: String) -> Int {
    var charactersDict = [Character: Int]()
    var maxLen = 0
    var lastRepeatPosition = -1
    var i = 0
    
    for char in s {
        if let position = charactersDict[char], position > lastRepeatPosition {
            lastRepeatPosition = position
        }
        
        maxLen = max(i - lastRepeatPosition, maxLen)
        charactersDict[char] = i
        i += 1
    }
    
    return maxLen
}

lenOfLongestSubstring(s: "abcabcbb")
