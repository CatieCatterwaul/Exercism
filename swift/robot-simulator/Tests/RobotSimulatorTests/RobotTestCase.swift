import XCTest
@testable import RobotSimulator

final class RobotTestCase: XCTestCase {
  typealias Coordinates = SimulatedRobot.Coordinates
  
  func test_Equality() {
    let simulatedRobot1 = SimulatedRobot(
      coordinates: Coordinates(x: 3, y: 8),
      bearing: .west
    )
    let simulatedRobot2 = SimulatedRobot(
      coordinates: Coordinates(x: 15, y: -300),
      bearing: .north
    )
    XCTAssertEqual(simulatedRobot1, simulatedRobot1)
    XCTAssertNotEqual(simulatedRobot1, simulatedRobot2)
  }

  func test_emptyInstructions() {
    var simulatedRobot1 = SimulatedRobot(
      coordinates: Coordinates(x: 15, y: -300),
      bearing: .north
    )
    let simulatedRobot2 = simulatedRobot1
    simulatedRobot1.evaluate("")
    XCTAssertEqual(simulatedRobot1, simulatedRobot2)
  }

  func test_advance() {
    var simulatedRobot = SimulatedRobot(
      coordinates: Coordinates(x: 0, y: 0),
      bearing: .south
    )
    simulatedRobot.evaluate("A")
    
    XCTAssertEqual(
      simulatedRobot.coordinates,
      Coordinates(x: 0, y: -1)
    )
  }

  func test_turn() {
    var simulatedRobot = SimulatedRobot(
      coordinates: Coordinates(x: 0, y: 0),
      bearing: .west
    )
    simulatedRobot.evaluate("R")
    XCTAssertEqual(simulatedRobot.bearing, .north)
  }

  func test_RAALAL() {
    var simulatedRobot = SimulatedRobot(
      coordinates: Coordinates(x: 7, y: 3),
      bearing: .north
    )
    simulatedRobot.evaluate("RAALAL")
    XCTAssertEqual(
      simulatedRobot,
      SimulatedRobot(
        coordinates: Coordinates(x: 9, y: 4),
        bearing: .west
      )
    )
  }
}
