import Foundation

let deliveryTracker = DeliveryTracker()
let roboSantaDeliveryTracker = DeliveryTracker(targetCount: 2)
while let instructions = readLine() {
  deliveryTracker.move(instructions)
  roboSantaDeliveryTracker.move(instructions)
}
print("Houses visited: \(deliveryTracker.numberOfHousesVisited)")
print("Houses visited with Robo-Santa: \(roboSantaDeliveryTracker.numberOfHousesVisited)")
