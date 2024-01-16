// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MuzeiSwiftAPI",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "MuzeiSwiftAPI",
            targets: ["MuzeiSwiftAPI"]
        ),
    ],
    targets: [
        .target(name: "MuzeiSwiftAPI"),
    ]
)
