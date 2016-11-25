import Foundation

var totalArea = 0
var totalRibbon = 0
let calculator = WrappingPaperCalculator()
while let specification = readLine() {
  do {
    totalArea += try calculator.areaRequired(specification: specification)
    totalRibbon += try calculator.ribbonRequired(specification: specification)
  } catch {
    print("Ignoring invalid specification: \(specification)")
  }
}
print("Wrapping paper required: \(totalArea)")
print("Ribbon required: \(totalRibbon)")
