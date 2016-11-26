typealias DeliveryCoordinate = (x: Int, y: Int)

enum Direction: Character {
  case north = "^"
  case east = ">"
  case south = "v"
  case west = "<"
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

  func move(_ instructions: String) {
    instructions.characters.forEach { instruction in
      guard let direction = Direction(rawValue: instruction) else { return }
      move(direction)
    }
  }
}
