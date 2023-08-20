import UIKit

func reorderLogFiles(_ logs: [String]) -> [String] {
    let numbers = logs.filter {
    Int(String(String($0.split(separator: " ")[1]).first!)) != nil
    }

        var letters = logs.filter {
            Int(String(String($0.split(separator: " ")[1]).first!)) == nil
        }

        letters.sort {
            let arrayOne = $0.split(separator: " ")
            let arrayTwo = $1.split(separator: " ")
            let str_one = String(arrayOne[1...].joined(separator: " "))
            let str_two = String(arrayTwo[1...].joined(separator: " "))

            if str_one == str_two {
                return String(arrayOne.first!) < String(arrayTwo.first!)
            }
            else {
                return str_one<str_two
            }
        }
        return letters + numbers
}

print(reorderLogFiles(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo","a2 act car"]))

/*
 Approach
 1. Sort all logs so that letter logs come before number logs
 (i.e "identifier foo" comes before "identifier 1")
 
 0. Create a final array (a collector)
 1. break all strings into two arrays - number logs and letter logs
 2. sort each array individually
 3. append letter array into finalArray
 4. append number array into finalArray
 5. return final array
 
 
 
 */
