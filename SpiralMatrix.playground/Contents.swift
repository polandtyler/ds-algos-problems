import UIKit

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var newArray = [Int]()
        if matrix.count == 0 || matrix[0].count == 0 {
            print("Empty array(s) found. Returning an empty array.")
            return newArray
         }
        
        if matrix.count == 1 { return matrix.first! }
        
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        var seen: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: columnCount), count: rowCount)
        
        let directionRow: [Int] = [0, 1, 0, -1]
        let directionColumn: [Int] = [1, 0, -1, 0]
        
        var row = 0, column = 0, direction = 0
        
        for _ in 0..<(rowCount * columnCount) {
            newArray.append(matrix[row][column])
            
            seen[row][column] = true
            
            let nextPositionRow = row + directionRow[direction]
            let nextPositionColumn  = column + directionColumn[direction]
            

            if (0 <= nextPositionRow &&
                nextPositionRow < rowCount &&
                0 <= nextPositionColumn &&
                nextPositionColumn < columnCount &&
                !seen[nextPositionRow][nextPositionColumn]) {
                    row = nextPositionRow
                    column = nextPositionColumn
            } else {
                direction = (direction + 1) % 4
                row += directionRow[direction]
                column += directionColumn[direction]
            }
        }
        
        return newArray
    }
}

print(Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
print(Solution().spiralOrder([[6,9,7]]))
print(Solution().spiralOrder([[7],[9],[6]]))
print(Solution().spiralOrder([[2,3,4],[5,6,7],[8,9,10],[11,12,13],[14,15,16]]))
