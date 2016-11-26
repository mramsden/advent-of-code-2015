import Foundation
import Commander

let main = command(
  Option("hash-padding", "00000", description: "The hash padding to accept"),
  Argument("key", description: "The key to find the answer for")
) { (hashPadding: String, key: String) in
  let miner = AdventCoinMiner(key: key, hashPadding: hashPadding)
  print("Answer: \(miner.lowestPositiveNumber)")
}

main.run()
