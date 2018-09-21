struct SimulatedRobot: Equatable {
  struct Coordinates: Equatable {
    var x: Int
    var y: Int
  }

  enum Bearing: CaseIterable {
    case north
    case east
    case south
    case west
  }
  
  enum Instruction: Character {
    case advance = "A"
    case turnLeft = "L"
    case turnRight = "R"
  }
  
  var coordinates: Coordinates
  var bearing: Bearing
  
  mutating func evaluate(_ instructions: String) {
    for instruction in [Instruction](instructions) {
      switch instruction {
      case .advance:
        advance()
      case .turnLeft:
        turnLeft()
      case .turnRight:
        turnRight()
      }
    }
  }
  
  mutating func advance() {
    switch bearing {
    case .north:
      coordinates.y += 1
    case .east:
      coordinates.x += 1
    case .south:
      coordinates.y -= 1
    case .west:
      coordinates.x -= 1
    }
  }
  
  mutating func turnRight() {
    turn(rotation: 1)
  }
  
  mutating func turnLeft() {
    turn(rotation: -1)
  }
  
  private mutating func turn(rotation: Int) {
    let bearings = Bearing.allCases
    let signedIndex =
      (bearings.firstIndex(of: bearing)! + rotation)
      % bearings.count
    let index =
      signedIndex < 0
      ? bearings.count + signedIndex
      : signedIndex
    bearing = bearings[index]
  }
}

//MARK:- Array
extension Array where Element == SimulatedRobot.Instruction {
  init(_ instructions: String) {
    self = instructions.compactMap(SimulatedRobot.Instruction.init)
  }
}

//MARK:- Weird API for tests 🤷🏽‍♀️
extension SimulatedRobot {
  init() {
    coordinates = Coordinates(x: 0, y: 0)
    bearing = Bearing.allCases[0]
  }
  
  mutating func at(x: Int, y: Int) {
    coordinates = Coordinates(x: x, y: y)
  }
  
  mutating func orient(_ bearing: Bearing) {
    self.bearing = bearing
  }
  
  mutating func place(x: Int, y: Int, direction: Bearing) {
    at(x: x, y: y)
    orient(direction)
  }
  
  func instructions(_ instructions: String) -> [Instruction] {
    return Array(instructions)
  }
}

extension SimulatedRobot.Coordinates: ExpressibleByArrayLiteral {
  init(arrayLiteral elements: Int...) {
    x = elements.first!
    y = elements.last!
  }
}
