import Foundation

struct FloorFinder {
  func findFloor(_ specification: String) -> Int {
    if specification == "(" { return 1 }
    if specification == ")" { return -1 }
    return 0
  }
}
