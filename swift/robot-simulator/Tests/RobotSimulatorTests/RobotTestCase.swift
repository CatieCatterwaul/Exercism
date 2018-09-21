import XCTest
@testable import RobotSimulator

final class RobotTestCase: XCTestCase {
  func test_Equality() {
    let robotSimulator1 = RobotSimulator(
      coordinates: (3, 8),
      orientation: .west
    )
    let robotSimulator2 = RobotSimulator(
      coordinates: (15, -300),
      orientation: .north
    )
    XCTAssertEqual(robotSimulator1, robotSimulator1)
    XCTAssertNotEqual(robotSimulator1, robotSimulator2)
  }
  
  func test_emptyInstructions() {
    var robotSimulator1 = RobotSimulator(
      coordinates: (15, -300),
      orientation: .north
    )
    let robotSimulator2 = robotSimulator1
    robotSimulator1.process(instructions: "")
    XCTAssertEqual(robotSimulator1, robotSimulator2)
  }
  
  func test_advance() {
    var robotSimulator = RobotSimulator(
      coordinates: (0, 0),
      orientation: .south
    )
    robotSimulator.process(instructions: "A")
    XCTAssertTrue(
      robotSimulator.coordinates == (0, -1),
      "\(robotSimulator.coordinates)"
    )
  }
  
  func test_turn() {
    var robotSimulator = RobotSimulator(
      coordinates: (0, 0),
      orientation: .west
    )
    robotSimulator.process(instructions: "R")
    XCTAssertEqual(robotSimulator.orientation, .north)
  }
  
  func test_RAALAL() {
    var robotSimulator = RobotSimulator(
      coordinates: (7, 3),
      orientation: .north
    )
    robotSimulator.process(instructions: "RAALAL")
    XCTAssertEqual(
      robotSimulator,
      RobotSimulator(
        coordinates: (9, 4),
        orientation: .west
      )
    )
  }
}
