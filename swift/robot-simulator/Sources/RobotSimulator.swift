struct RobotSimulator {
  typealias Coordinates = (Int, Int)
  
  enum Orientation: CaseIterable {
    case north
    case east
    case south
    case west
  }
  
  var coordinates: Coordinates
  var orientation: Orientation
  
  init(coordinates: Coordinates, orientation: Orientation) {
    self.coordinates = coordinates
    self.orientation = orientation
  }
  
  mutating func process(instructions: String) {
    enum Instruction: Character {
      case advance = "A"
      case turnLeft = "L"
      case turnRight = "R"
    }
    
    for instruction in instructions.compactMap(Instruction.init) {
      func turn(rotation: Int) {
        let orientations = Orientation.allCases
        let signedIndex =
          (orientations.firstIndex(of: orientation)! + rotation)
          % orientations.count
        let index =
          signedIndex < 0
          ? orientations.count + signedIndex
          : signedIndex
        orientation = orientations[index]
      }
      
      switch instruction {
      case .advance:
        switch orientation {
        case .north:
          coordinates.1 += 1
        case .east:
          coordinates.0 += 1
        case .south:
          coordinates.1 -= 1
        case .west:
          coordinates.0 -= 1
        }
      case .turnLeft:
        turn(rotation: -1)
      case .turnRight:
        turn(rotation: 1)
      }
    }
  }
}

extension RobotSimulator: Equatable {
  static func == (robot0: RobotSimulator, robot1: RobotSimulator) -> Bool {
    return
      robot0.coordinates == robot1.coordinates
      &&
      robot0.orientation == robot1.orientation
  }
}
