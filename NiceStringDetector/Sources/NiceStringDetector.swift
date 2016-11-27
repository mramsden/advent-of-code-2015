struct NiceStringDetector {
  static let vowels = "aeiou"

  func isNice(string: String) -> Bool {
    return vowelsValid(string: string) &&
      repeatsCharacters(string: string)
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
}
