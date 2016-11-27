import Foundation

struct NiceStringDetector {
  static let vowels = "aeiou"
  static let badPairs = ["ab", "cd", "pq", "xy"]

  func isNice(string: String) -> Bool {
    return vowelsValid(string: string) &&
      repeatsCharacters(string: string) &&
      !containsBadPair(string: string)
  }

  private func vowelsValid(string: String) -> Bool {
    return string.characters.filter { character in
      return NiceStringDetector.vowels.characters.filter { vowel in
        return character == vowel
      }.count >= 1
    }.count >= 3
  }

  private func repeatsCharacters(string: String) -> Bool {
    var lastCharacter: Character? = nil
    return string.characters.reduce(false) { repeats, character in
      if lastCharacter == nil || lastCharacter != character {
        lastCharacter = character
        return repeats
      }
      return true
    }
  }

  private func containsBadPair(string: String) -> Bool {
    return NiceStringDetector.badPairs.filter { badPair in
      return string.lowercased().range(of: badPair) != nil
    }.count > 0
  }
}
