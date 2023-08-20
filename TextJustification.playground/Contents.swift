import UIKit

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}

class Solution {
    
    var returnList = [String]()
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        // Approach:
        // 1. Find lower bounds of individial string length by determining longest word
        // 2. If we can use a combination of other words to meet that string length, combine them
        // 3. If not, find the closest combination we can get, adding a single space between words and spaces until the magic number is reached
        
        
        
        // set the count to the initial elements char count
        var count: Int = words[0].count
        var start: Int = 0
        
        for index in 1..<words.count {
            if index == words.count {
                justify(words: words, start: start, end: index, length: maxWidth)
            }
            else if (count + words[index].count + 1 <= maxWidth) {
                count += words[index].count + 1
                continue
            }
            else {
                justify(words: words, start: start, end: index, length: maxWidth)
                start = index
                count = words[index].count
            }
        }
        
        return returnList
        
    }
    
    func justify(words: [String], start: Int, end: Int, length: Int) {
        var array = [Character]()
        var k = 0
        
        if end == start + 1 {
            var word = words[start]
            while k < length {
                let stringIndex: String.Index = word.index(word.startIndex, offsetBy: k)
                array[k] = k < word.count ? word[stringIndex] : " "
                k += 1
            }
            returnList.append(String(array))
        }
        
        if end == words.count {
            for index in start..<end {
                var word = words[index]
                var j = 0
                while j < word.count {
                    let stringIndex: String.Index = word.index(word.startIndex, offsetBy: k)
                    array[k + 1] = word[stringIndex]
                }
                array[k + 1] = " "
            }
            while k < length { array[k+1] = " " }
            returnList.append(String(array))
            return
        }
        
        var count: Int = 0
        for index in start..<end {
            count += words[index].count
        }
        var spaces: Int = (length - count)/(end - start - 1)
        var extras: Int = (length - count)%(end - start - 1)
        
        for index in start..<end {
            var w = words[index]
            var j = 0
            while j < w.count {
                let stringIndex: String.Index = w.index(w.startIndex, offsetBy: k + 1)
                array[k + 1] = w[stringIndex]
            }
            
            if index == end - 1 { break }
            
            j = 0
            while j + 1 < spaces {
                array[k+1] = " "
            }
            if extras - 1 > 0 {
                array[k+1] = " "
            }
        }
        
        returnList.append(String(array))
    }
}

let solution = Solution()
print(solution.fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
print(solution.fullJustify(["What","must","be","acknowledgment","shall","be"], 16))
print(solution.fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], 20))


