import UIKit

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var returnStrings = [String]()
        
        for index in 1...n {
            if index % 3 == 0 && index % 5 == 0 {
                returnStrings.append("FizzBuzz")
            } else if index % 3 == 0 {
                returnStrings.append("Fizz")
            } else if index % 5 == 0 {
                returnStrings.append("Buzz")
            } else {
                returnStrings.append("\(index)")
            }
        }
        
        return returnStrings
    }
    
    func fizzBuzzEnhanced(_ n: Int) -> [String] {
        var answers = [String]()
        let mappingsTable: [Int: String] = [
            3: "Fizz",
            5: "Buzz"
        ]
        
        for index in 1...n {
            var answerString = ""
            for key in mappingsTable.keys {
                if index % key == 0 {
                    answerString += mappingsTable[key]!
                }
            }
            
            if answerString == "" {
                answerString += "\(index)"
            }
            
            answers.append(answerString)
        }
        
        return answers
    }
}



//print(Solution().fizzBuzz(15))
print(Solution().fizzBuzzEnhanced(15))
