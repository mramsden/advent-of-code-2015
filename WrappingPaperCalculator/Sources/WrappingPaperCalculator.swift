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

    return (components[0], components[1], components[2])
  }

  func areaRequired(_ l: Int, _ w: Int, _ h: Int) throws -> Int {
    let sides = [l * w, w * h, h * l]
    return sides.map{ $0 * 2 }.reduce(0, +) + (sides.min() ?? 0)
  }
}
