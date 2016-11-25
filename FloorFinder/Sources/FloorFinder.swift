import Foundation

struct FloorFinder {
  func findFloor(_ specification: String) -> Int {
    return specification.characters.reduce(0) { sum, character in
      if character == "(" { return sum + 1 }
      if character == ")" { return sum - 1 }
      return sum
    }
  }

  func findBasementPosition(_ specification: String) -> Int? {
    var level = 0
    for (index, character) in specification.characters.enumerated() {
      level += findFloor(String(character))
      if level < 0 { return index + 1 }
    }
    return nil
  }
}
