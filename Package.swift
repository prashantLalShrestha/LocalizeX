// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalizeX",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "LocalizeX",
            targets: ["LocalizeX"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "LocalizeX",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "LocalizeXTests",
            dependencies: ["LocalizeX"],
            path: "LocalizeXTests"),
    ]
)
