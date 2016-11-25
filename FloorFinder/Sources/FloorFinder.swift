import Foundation

struct FloorFinder {
  func findFloor(_ specification: String) -> Int {
    return specification.characters.reduce(0) { sum, character in
      if character == "(" { return sum + 1 }
      if character == ")" { return sum - 1 }
      return sum
    }
  }
}
