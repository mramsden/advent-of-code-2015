import Foundation

print("Enter key>", terminator: " ")
let key = readLine()
let miner = AdventCoinMiner(key: key!)
print("Answer: \(miner.lowestPositiveNumber)")
