import PackageDescription

let package = Package(
    name: "AdventCoinMiner",
    dependencies: [
      .Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", Version(0, 8, 1)),
    ]
)
