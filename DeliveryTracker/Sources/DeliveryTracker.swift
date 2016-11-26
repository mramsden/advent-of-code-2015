typealias DeliveryCoordinate = (x: Int, y: Int)

enum Direction: Character {
  case north = "^"
  case east = ">"
  case south = "v"
  case west = "<"
}

class DeliveryTracker {

  static let startingLocation = (x: 0, y: 0)

  private(set) var currentLocations: [DeliveryCoordinate]
  private var coordinatesVisited = [startingLocation]
  private let targetCount: Int
  private var currentTarget = 0

  init(targetCount: Int = 1) {
    self.targetCount = targetCount
    currentLocations = Array(repeating: DeliveryTracker.startingLocation, count: targetCount)
  }

  var numberOfHousesVisited: Int {
    return coordinatesVisited.count
  }

  func move(_ direction: Direction) {
    var currentLocation = currentLocations[currentTarget]
    switch direction {
      case .north: currentLocation.y += 1
      case .east: currentLocation.x += 1
      case .south: currentLocation.y -= 1
      case .west: currentLocation.x -= 1
    }
    currentLocations[currentTarget] = currentLocation
    currentTarget = (currentTarget == targetCount - 1) ? 0 : currentTarget + 1

    if !coordinatesVisited.contains(where: { $0 == currentLocation }) {
      coordinatesVisited += [currentLocation]
    }
  }

  func move(_ instructions: String) {
    instructions.characters.forEach { instruction in
      guard let direction = Direction(rawValue: instruction) else { return }
      move(direction)
    }
  }
}
