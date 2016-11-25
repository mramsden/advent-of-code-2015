import Foundation

enum WrappingPaperCalculatorError: Error {
  case invalidFormat
}

struct WrappingPaperCalculator {
  func parseComponents(_ input: String) throws -> (Int, Int, Int) {
    var components = input.components(separatedBy: "x").flatMap { Int($0) }
    if components.count < 3 || components.count > 3 {
      throw WrappingPaperCalculatorError.invalidFormat
    }

    return (l: components[0], w: components[1], h: components[2])
  }

  func areaRequired(_ input: String) throws -> Int {
    let components = try parseComponents(input)
    let sides = [
      components.1 * components.2,
      components.2 * components.3,
      components.3 * components.1,
    ]
    return sides.reduce(0) { $0 + (2 * $1) } + sides.reduce(0) { $0 == 0 || $1 < $0 ? $1 : 0 }
  }
}
