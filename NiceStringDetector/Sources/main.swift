import Foundation

var niceStrings = 0
let detector = NiceStringDetector()
while let string = readLine() {
  niceStrings += detector.isNice(string: string) ? 1 : 0
}
print("Nice strings: \(niceStrings)")
