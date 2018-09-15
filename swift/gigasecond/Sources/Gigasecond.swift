import Foundation

struct Gigasecond {
  fileprivate let date: Date
}

//MARK: internal
extension Gigasecond {
  init?(from string: String) {
    guard let date = Gigasecond.formatter.date(from: string)
    else { return nil }
    
    self.date = date + 1_000_000_000
  }

  var description: String {
    return Gigasecond.formatter.string(from: date)
  }
}

//MARK: private
private extension Gigasecond {
  static var formatter: ISO8601DateFormatter {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions.remove(.withTimeZone)
    return formatter
  }
}
