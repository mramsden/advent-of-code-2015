import Cryptor

struct AdventCoinMiner {

  let key: String

  var lowestPositiveNumber: Int {
    var current = 0
    while true {
      let md5 = Digest(using: .md5).update(string: "\(key)\(current)")!
      let hash = CryptoUtils.hexString(from: md5.final())
      if hash.hasPrefix("00000") {
        return current
      }
      current += 1
    }
  }
}
