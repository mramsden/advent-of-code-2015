typealias DeliveryCoordinate = (x: Int, y: Int)

enum Direction {
  case north
  case east
  case south
  case west
}

class DeliveryTracker {
  
  static let startingLocation = (x: 0, y: 0)

  private(set) var currentLocation = startingLocation
  private var housesVisited = [startingLocation]

  var numberOfHousesVisited: Int {
    return housesVisited.count
  }

  func move(_ direction: Direction) {
    switch direction {
      case .north: currentLocation.y += 1
      case .east: currentLocation.x += 1
      case .south: currentLocation.y -= 1
      case .west: currentLocation.x -= 1
    }

    if !housesVisited.contains(where: { $0 == currentLocation }) {
      housesVisited += [currentLocation]
    }
  }
}
