import UIKit

func wordsToNumbers(_ numbers: String) -> String {
    let rawNumbers = numbers.split(separator: ";")
    
    var temp = ""
    for stringRepresentation in rawNumbers {
        let charString = String(stringRepresentation)
        if let formatted = charString.asInt {
            temp.append("\(formatted)")
        } else {
            temp.append("")
        }
    }
    return temp
}

extension String {
    public var asInt: Int? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.isLenient = true
        if let number = formatter.number(from: self) as? Int {
            return number
        }
        
        return nil
    }
}

print(wordsToNumbers("zero;two;five;seven;eight;four;three;seven;eight;nine;two"))
print(print(wordsToNumbers("zero;one;eight;ninetynine;tomato;0")))
