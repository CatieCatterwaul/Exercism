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
  
  let coordinates = [3, 0]
  let bearing: Bearing = .east
  
//  init() {
//    self.bearing = .east
//  }
  
  func at(x: Int, y: Int) {
    
  }
  
  func place(x: Int, y: Int, direction: Bearing) {
    
  }
  
  func instructions(_: String) -> [Instruction] {
    return [.turnLeft]
  }
  
  func evaluate(_: String) {
    
  }
  
  func orient(_: Bearing) {
    
  }
  
  func advance() {
    
  }
  
  func turnRight() {
    
  }
  
  func turnLeft() {
    
  }
}
