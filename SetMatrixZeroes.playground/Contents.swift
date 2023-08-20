import UIKit

var matrix = [
  [0,1,1],
  [1,0,1],
  [1,1,1]
]

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        guard rows > 0 else { return }
        let columns = matrix[0].count
        var firstRowNeedsReset = false
        var firstColumnNeedsReset = false
        
        for row in 0..<rows {
            for column in 0..<columns {
                guard matrix[row][column] == 0 else { continue }
                matrix[row][0] = 0
                matrix[0][column] = 0
                
                if row == 0 {
                    firstRowNeedsReset = true
                }
                if column == 0 {
                    firstColumnNeedsReset = true
                }
            }
        }
        
        for row in 1..<rows {
            guard matrix[row][0] == 0 else { continue }
            for column in 0..<columns {
                matrix[row][column] = 0
            }
        }
        
        for column in 1..<columns {
            guard matrix[0][column] == 0 else { continue }
            for row in 0..<rows {
                matrix[row][column] = 0
            }
        }
        
        if firstColumnNeedsReset {
           for row in 0..<rows {
               matrix[row][0] = 0
           }
       }
        
        if firstRowNeedsReset {
            for column in 0..<columns {
                matrix[0][column] = 0
            }
        }
    }
}

func printFormattedMatrix(_ oldOrNew: String, matrix: [[Int]]) {
    print("\(oldOrNew): ")
    for array in matrix {
        print(array)
    }
}

Solution().setZeroes(&matrix)
