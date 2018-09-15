struct Squares {
  private let upperLimit: Int
}

//MARK: internal
extension Squares {
  init(_ upperLimit: Int) {
    self.upperLimit = upperLimit
  }

  var squareOfSum: Int {
    let sum = (0...upperLimit).reduce(into: 0, +=)
    return sum * sum
  }
  
  var sumOfSquares: Int {
    return (0...upperLimit).reduce(into: 0) { sum, number in
      sum += number * number
    }
  }
  
  var differenceOfSquares: Int {
    return squareOfSum - sumOfSquares
  }
}
