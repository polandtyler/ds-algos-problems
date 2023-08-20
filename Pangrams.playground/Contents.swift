import UIKit

func missingLetters(_ phrase: String) -> String {
    var alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphabet.removeAll { character in
        phrase.contains(character)
    }
    
    if alphabet != "" {
        return alphabet
    } else {
        return "NULL"
    }
}

print(missingLetters("A quick brown fox jumps over the lazy dog"))
print(missingLetters("A slow yellow fox crawls under the proactive dog"))
print(missingLetters(" "))
print(missingLetters("012"))
