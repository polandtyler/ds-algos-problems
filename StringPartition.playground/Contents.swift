import UIKit

func partitionLabels(_ S: String) -> [Int] {
    var array = Array(S)
    
    func charAt(_ index: Int) -> Character {
        return array[index]
    }
    
    guard array.count > 0 else { return [] }
    var charEndMap = [Character: Int]()
    
    for index in 0..<array.count {
        charEndMap[charAt(index)] = index
    }
    
    var last = 0
    var start = 0
    var result = [Int]()
    for index in 0..<array.count {
        guard let lastRepeat = charEndMap[charAt(index)] else { return [] }
        last = max(last, lastRepeat)
        if last == index {
            result.append(last - start + 1)
            start = last + 1
        }
    }
    
    return result
}
