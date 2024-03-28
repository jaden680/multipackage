// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Multi Package",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SharedPackage", 
            targets: ["SharedPackage"]
        ),
        .library(
            name: "PackageA",
            targets: ["PackageA"]),
        .library(
            name: "PackageB",
            targets: ["PackageB"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SharedPackage",
            path: "SharedPackage",
            sources: ["Sources"]
        ),
        .target(
            name: "PackageA",
            dependencies: ["SharedPackage"],
            path: "PackageA",
            sources: ["Sources"]
        ),
        .target(
            name: "PackageB",
            dependencies: ["SharedPackage"],
            path: "PackageB",
            sources: ["Sources"]
        )
    ]
)
