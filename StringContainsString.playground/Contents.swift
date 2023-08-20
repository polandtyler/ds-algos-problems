import UIKit

/*
 Write your own version of the `contains()` method on String that ignores letter case, and without using the existing `contains` method
 */

extension String {
    func fuzzyContains(_ s: String) -> Bool {
//        return self.uppercased().range(of: s.uppercased()) != nil
        return self.range(of: s, options: .caseInsensitive) != nil // syntactic sugar
    }
}

/*
 EXPLANATION:
 range(of:) method returns the position of one string inside another.
 As it's possible rthe substring might not exist in the other,
 the return value is optional.
 
 If we call range(of:) and get back nil, it means the substring isnt concatenated
 inside the check string
 */

print("Hello, world".fuzzyContains("Hello"))
print("Hello, world".fuzzyContains("WORLD"))
print("Hello, world".fuzzyContains("Goodbye"))
