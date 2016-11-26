import Foundation

let deliveryTracker = DeliveryTracker()
while let instructions = readLine() {
  deliveryTracker.move(instructions)
}
print("Houses visited: \(deliveryTracker.numberOfHousesVisited)")
