import UIKit

func isPalindrome(input: String) -> Bool {
    return String(input.reversed()).lowercased() == input.lowercased()
}

print(isPalindrome(input: "rotator") == true)
print(isPalindrome(input: "Rats live on no evil star") == true)
print(isPalindrome(input: "Never odd or even") == false)
print(isPalindrome(input: "Hello, world") == false)
