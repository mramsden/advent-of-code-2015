import Foundation

var specification = ""
while let part = readLine() {
  specification += part
}
let finder = FloorFinder()
let floor = finder.findFloor(specification)
let basementPosition = finder.findBasementPosition(specification)
print("Go to floor \(floor)")
print("Basement position \(basementPosition)")
