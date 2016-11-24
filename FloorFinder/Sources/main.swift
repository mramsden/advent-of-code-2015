import Foundation

var specification = ""
while let part = readLine() {
  specification += part
}
let floor = FloorFinder().findFloor(specification)
print("Go to floor \(floor)")
