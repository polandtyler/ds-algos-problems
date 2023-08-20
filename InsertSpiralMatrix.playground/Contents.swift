import UIKit

func spiralMatrix(_ max: Int) -> [[Int]] {
    var final = Array(0..<max).map({ _ in [Int](repeating: 0, count: max) })
    
    // APPROACH:
    // 0. Create a [[Int]] to return final solution
    // 1. Create vars to track position
    // 2. Create variables to represent move to make and direction
    // 3. Iterator (index-based)
    // 4. Append value to final [[Int]] at position [row][column]
    // 5. Define the next index by adding the pointer deltas to the pointers
    // 6. Add constraints - a check to see if the "next" index is empty?
    // 7. Define movement characteristics
    // 8. Move the pointers by adding delta to row and column pointers
    // 9. Return array from step 0
    
    // set variables to move to later position
    var row = 0
    var column = 0
    
    // set variables that track direction (0 = no move, 1 = move forward, -1 = move backward
    var deltaRow = 0
    var deltaColumn = 1
    
    // create an iterator from 1 - the max number
    for number in 1...(max*max) {
        // set the number
        final[row][column] = number
        
        // increase/decrease the position of the current "pointer"
        let nextI = row + deltaRow
        let nextJ = column + deltaColumn
        
        // determine if the next cell is empty
        // if none of the values match the next i, none of the values match the next j, and the the next value is not the start value
        if !(0..<max ~= nextI) && (0..<max ~= nextJ) && (final[nextI][nextJ] == 0) {
            // if the move value for the column pointer is 1, we want to move the row value 1 and keep the column constant
            if deltaColumn == 1 { deltaRow = 1; deltaColumn = 0; }
            // if the move value for row is 1, we want to move the column pointer a single index backward
            else if deltaRow == 1 { deltaRow = 0; deltaColumn = -1; }
            // if the move value for column is backward 1, we want to move the row pointer a single index backward
            else if deltaColumn == -1 { deltaRow = -1; deltaColumn = 0; }
            // if the moveValue for row is backward 1, we want to move the column pointer a single index backward
            else if deltaRow == -1 { deltaRow = 0; deltaColumn = 1; }
        }
        
        // add the difference to the row to get a "current" position
        row += deltaRow
        // add the difference to the column to get a "current" position
        column += deltaColumn
    }
    return final
}



for intArray in spiralMatrix(4) {
    print(intArray)
}
print(spiralMatrix(4))



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
print(spiralOrder(spiralMatrix(4)))
//print(spiralMatrixExample(4))
