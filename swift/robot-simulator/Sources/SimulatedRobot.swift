struct SimulatedRobot {
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
  
  var coordinates: [Int]!
  var bearing: Bearing!
  
  mutating func at(x: Int, y: Int) {
    coordinates = [x, y]
  }
  
  mutating func orient(_ bearing: Bearing) {
    self.bearing = bearing
  }
  
  mutating func place(x: Int, y: Int, direction: Bearing) {
    at(x: x, y: y)
    orient(direction)
  }
  
  func instructions(_ instructions: String) -> [Instruction] {
    return instructions.compactMap(Instruction.init)
  }
  
  mutating func evaluate(_ instructions: String) {
    for instruction in self.instructions(instructions) {
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
    switch bearing! {
    case .north:
      coordinates[1] += 1
    case .east:
      coordinates[0] += 1
    case .south:
      coordinates[1] -= 1
    case .west:
      coordinates[0] -= 1
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
