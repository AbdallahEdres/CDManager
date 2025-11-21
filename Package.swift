// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CDManager",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "CDManager",
            targets: ["CDManager"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CDManager",
            dependencies: [],
            path: "Sources/CDManager"
        ),
        .testTarget(
            name: "CDManagerTests",
            dependencies: ["CDManager"],
            path: "Tests/CDManagerTests"
        ),
    ]
)
