// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "NominatimSwift",
    products: [
        .library(
            name: "NominatimSwift",
            targets: [
                "NominatimSwift"
            ]
        )
    ],
    dependencies: [
       .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "NominatimSwift",
            dependencies: [
                "Logging"
            ]
        ),
        .testTarget(
            name: "NominatimSwiftTests",
            dependencies: [
                "NominatimSwift"
            ]
        )
    ]
)
