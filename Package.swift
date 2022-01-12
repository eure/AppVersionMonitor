// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "AppVersionMonitor",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "AppVersionMonitor", targets: ["AppVersionMonitor"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "AppVersionMonitor",
      exclude: ["Info.plist"]
    ),
  ]
)
