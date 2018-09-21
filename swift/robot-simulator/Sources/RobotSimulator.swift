extension SimulatedRobot: Equatable {
  static func == (robot0: SimulatedRobot, robot1: SimulatedRobot) -> Bool {
    return
      robot0.coordinates == robot1.coordinates
      &&
      robot0.bearing == robot1.bearing
  }
}
