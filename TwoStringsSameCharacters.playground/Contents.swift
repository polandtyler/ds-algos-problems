import UIKit

/*
 Do two Strings contain the same Characters?
 Write a function that accepts two String parameters, and
 returns true if they contain the same characters in any order
 taking into account letter casing
 */

func containsSameLetters(first: String, second: String) ->  Bool {
    var checkString = second
    
    for characterInFirstString in first {
        if let index = checkString.firstIndex(of: characterInFirstString) {
            checkString.remove(at: index)
        } else {
            return false
        }
    }
    
    return checkString.count == 0
}

func optimimizedSolution(first: String, second: String) -> Bool {
    // strings are sequences, so we can sort them!
    return first.sorted() == second.sorted()
}

print(containsSameLetters(first: "abca", second: "abca") == true)
print(containsSameLetters(first: "abc", second: "cba") == true)
print(containsSameLetters(first: "a1 b2", second: "b1 a2") == true)
print(containsSameLetters(first: "abc", second: "abca") == false)
print(containsSameLetters(first: "abc", second: "cbAa") == false)
print(containsSameLetters(first: "abcc", second: "abca") == false)

print(optimimizedSolution(first: "abca", second: "abca") == true)
print(optimimizedSolution(first: "abc", second: "cba") == true)
print(optimimizedSolution(first: "a1 b2", second: "b1 a2") == true)
print(optimimizedSolution(first: "abc", second: "abca") == false)
print(optimimizedSolution(first: "abc", second: "cbAa") == false)
print(optimimizedSolution(first: "abcc", second: "abca") == false)
