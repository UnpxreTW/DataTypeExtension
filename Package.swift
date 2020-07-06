// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataTypeExtension",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "DataTypeExtension", type: .dynamic, targets: ["DataTypeExtension"]),
        .library(name: "UITypeExtension", type: .dynamic, targets: ["UITypeExtension"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "DataTypeExtension", dependencies: []),
        .target(name: "UITypeExtension", dependencies: ["DataTypeExtension"]),
        .testTarget(name: "DataTypeExtensionTests", dependencies: ["DataTypeExtension"]),
    ]
)
