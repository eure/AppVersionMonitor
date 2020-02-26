// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "AppVersionMonitor",
    // platforms: [.iOS("8.0")],
    products: [
        .library(name: "AppVersionMonitor", targets: ["AppVersionMonitor"])
    ],
    targets: [
        .target(
            name: "AppVersionMonitor",
            path: "Sources"
        )
    ]
)
