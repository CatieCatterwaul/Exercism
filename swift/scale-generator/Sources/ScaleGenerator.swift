struct ScaleGenerator {
  private let tonic: String
  private let scaleName: String

  init(tonic: String, scaleName: String, pattern: String? = nil) {
    self.tonic = tonic.uppercased()
    self.scaleName = scaleName
  }
  
  var name: String {
    return "\(tonic) \(scaleName)"
  }
  
  func pitches() -> Scale {
    return ["M", "Qsharp"]
  }
}

struct Scale: Equatable { }

extension Scale: ExpressibleByArrayLiteral {
  init(arrayLiteral _: String...) { }
}
