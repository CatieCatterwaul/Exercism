struct Board {
  enum BoardError: Error {
    case differentLength
    case faultyBorder
    case invalidCharacter
  }
  
  init(_ input: [String]) throws {
    guard ( input.last!.allSatisfy { character in
      ["+", "-"].contains(character)
    } ) else { throw BoardError.faultyBorder }
    
    guard ( input.allSatisfy { row in
      input.first!.count == row.count
    } ) else { throw BoardError.differentLength }
    
    guard ( input.dropFirst().dropLast().joined().allSatisfy { character in
      ["|", " ", "*"].contains(character)
    } ) else { throw BoardError.invalidCharacter }
      
    bombCoordinates = input.enumerated().flatMap { row in
      row.element.enumerated().compactMap { x, square in
        let y = row.offset
        return square == "*" ? (x - 1, y - 1) : nil
      }
    }
    
    height = input.count - 2
    width = input.first!.count - 2
  }
  
  private let bombCoordinates: [(Int, Int)]
  private let width: Int
  private let height: Int
  
  func transform() -> [String] {
    func getCharacter(_ x: Int, _ y: Int) -> String {
      let squareDistancesToBombs = bombCoordinates.map { bombCoordinates -> Int in
        let distances = (bombCoordinates.0 - x, bombCoordinates.1 - y)
        return distances.0 * distances.0 + distances.1 * distances.1
      }
      
      return
        squareDistancesToBombs.contains(0)
        ? "*"
        : {
          let bombCount =
            squareDistancesToBombs
            .filter { $0 <= 2 }
            .count
          
          return bombCount == 0 ? " " : String(bombCount)
        } ()
    }
    
    let border = ["+\(String(repeating: "-", count: width))+"]
    
    return
      border
      +
      (0..<height).map { y -> String in
        let row = (0..<width).map { x in getCharacter(x, y) } .joined()
        return "|\(row)|"
      }
      +
      border 
  }
}
