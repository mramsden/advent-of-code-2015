import PackageDescription

let package = Package(
    name: "AdventCoinMiner",
    dependencies: [
      .Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", majorVersion: 0, minor: 8),
      .Package(url: "https://github.com/kylef/Commander", majorVersion: 0, minor: 5),
    ]
)
