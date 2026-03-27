// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SizeAlike",
    products: [
        .library(
            name: "SizeAlike",
            targets: ["SizeAlike"]
        ),
    ],
    targets: [
        .target(
            name: "SizeAlike"
        ),
        .testTarget(
            name: "SizeAlikeTests",
            dependencies: ["SizeAlike"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
