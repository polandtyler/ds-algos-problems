import UIKit

func rotateSingleLeft<T>(array: inout [T]) {
    let first = array[0]
    for i in 0..<array.count - 1 {
        array[i] = array[i + 1]
    }
    array[array.count - 1] = first
}

func rotateSingleRight<T>(array: inout [T]) {
    let last = array[array.count - 1]
    for i in 1..<array.count {
        array[i] = array[i - 1]
    }
    array[0] = last
}

var arrayToRotate = [1, 2, 3, 4, 5, 6, 7, 8, 9]
rotateSingleLeft(array: &arrayToRotate)
print(arrayToRotate)


extension Array {
    func rotateLeft(numberOfTimes: Int) -> [Element] {
        var returnArr = self
        for _ in 0..<numberOfTimes {
            rotateSingleLeft(array: &returnArr)
        }
        
        return returnArr
    }
    
    func rotateRight(numberOfTimes: Int) -> [Element] {
        var returnArr = self
        for _ in 0..<numberOfTimes {
            rotateSingleRight(array: &returnArr)
        }
        
        return returnArr
    }
}
var arrayToRotateToo = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(arrayToRotateToo.rotateLeft(numberOfTimes: 2))
print(arrayToRotateToo.rotateRight(numberOfTimes: 2))
