import UIKit

func threeSum(_ nums: [Int]) -> [[Int]] {
    // sort the numbers
    let sorted = nums.sorted()
    
    // create storage for the final result
    var results = [[Int]]()
    
    // get a count for the sorted array
    let count = sorted.count
    
    // handle the empty case
    if count < 3 { return [] }
    
    
    var firstIndex = 0 // first number in the triad, hold this until the end
    
    
    while firstIndex < count - 2 {
        let first = sorted[firstIndex]
        
        // we are going to look for two other numbers that together, match the opposite (this obviously wouldnt work if we were searching for a target
        let target = first * -1
        var secondIndex = firstIndex + 1
        var thirdIndex = count - 1
        
        while secondIndex < thirdIndex {
            let second = sorted[secondIndex]
            let third = sorted[thirdIndex]
            if second + third > target {
                thirdIndex -= 1
                continue
            }
            if second + third < target {
                secondIndex += 1
                continue
            }
            
//            if second + third == target
            results.append([first, second, third])
            
            while secondIndex < count - 1 && sorted[secondIndex] == second {
                secondIndex += 1
            }
            
            while thirdIndex > secondIndex && sorted[thirdIndex] == third {
                thirdIndex -= 1
            }
        }
        
        while firstIndex < count - 2 && sorted[firstIndex] == first {
            firstIndex += 1
        }
    }
    
    return results
}

print(threeSum([-1, 0, 1, 2, -1, -4]))
