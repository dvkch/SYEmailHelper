// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SYEmailHelper",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "SYEmailHelper",
            targets: ["SYEmailHelper"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SYEmailHelper",
            dependencies: []),
//        .testTarget(
//            name: "SYEmailHelperTests",
//            dependencies: ["SYEmailHelper"]),
    ]
)
