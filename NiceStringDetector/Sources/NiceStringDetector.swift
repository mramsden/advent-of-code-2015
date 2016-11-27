struct NiceStringDetector {
  static let vowels = "aeiou"

  func isNice(string: String) -> Bool {
    return string.characters.filter { character in
      return NiceStringDetector.vowels.characters.filter { vowel in
        return character == vowel
      }.count >= 1
    }.count >= 3
  }
}
