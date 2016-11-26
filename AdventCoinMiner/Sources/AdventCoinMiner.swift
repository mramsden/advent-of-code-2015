import Cryptor

struct AdventCoinMiner {

  let key: String
  let hashPadding: String

  init(key: String, hashPadding: String = "00000") {
    self.key = key
    self.hashPadding = hashPadding
  }

  var lowestPositiveNumber: Int {
    var current = 0
    while true {
      let md5 = Digest(using: .md5).update(string: "\(key)\(current)")!
      let hash = CryptoUtils.hexString(from: md5.final())
      if hash.hasPrefix(hashPadding) {
        return current
      }
      current += 1
    }
  }
}
