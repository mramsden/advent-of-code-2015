typealias DeliveryCoordinate = (x: Int, y: Int)

enum Direction {
  case north
  case east
  case south
  case west
}

class DeliveryTracker {

    private(set) var currentLocation = (x: 0, y: 0)
    private(set) var numberOfHousesVisited = 1

    func move(_ direction: Direction) {
      switch direction {
        case .north: currentLocation.y += 1
        case .east: currentLocation.x += 1
        case .south: currentLocation.y -= 1
        case .west: currentLocation.x -= 1
      }
      numberOfHousesVisited += 1
    }
}
