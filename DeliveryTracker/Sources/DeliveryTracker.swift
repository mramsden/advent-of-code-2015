typealias DeliveryCoordinate = (x: Int, y: Int)

class DeliveryTracker {

    private(set) var currentLocation = (x: 0, y: 0)
    private(set) var numberOfHousesVisited = 1
}
