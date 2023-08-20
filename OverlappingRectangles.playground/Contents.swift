import UIKit

func isOverlap(rect1: [Int], rect2: [Int]) -> Bool {
    return min(rect1[2], rect2[2]) > max(rect1[0], rect2[0])
}

print(isOverlap(rect1: [0,0,2,2], rect2: [1,1,3,3]))
print(isOverlap(rect1: [0,0,1,1], rect2: [1,0,2,1]))
print(isOverlap(rect1: [5,15,8,18], rect2: [0,3,7,9]))
