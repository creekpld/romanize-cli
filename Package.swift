// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "romanize-cli",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/nsomar/Guaka.git", from: "0.3.1"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.2"),
	    .package(url: "https://github.com/creekpld/romanize.git", from: "1.2.5"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "romanize-cli",
            dependencies: ["Guaka", "PathKit", "Romanize"]),
    ]
)
