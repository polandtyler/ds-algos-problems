import Foundation

/*
 Challenge 1: Are the letters unique?
 Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
 */
func isUnique(s: String) -> Bool {
        // intuition: sets are collections that do not contain duplicate elements
        return Set(s).count == s.count
}

print(isUnique(s: "BOB") == false)
print(isUnique(s: "abcdefghijklmnopqrstuvwxyzZ") == true)
print(isUnique(s: "AaBbCc") == true)
