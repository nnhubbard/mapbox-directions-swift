// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MapboxDirections",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "MapboxDirections",
            targets: [
                "MapboxDirections",
                "MapboxDirectionsObjc"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/raphaelmor/Polyline", exact: "5.1.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", .upToNextMajor(from: "9.0.0"))
    ],
    targets: [
        .target(
            name: "MapboxDirections",
            dependencies: [
                "Polyline",
                "MapboxDirectionsObjc"
            ],
            path: "MapboxDirections"
        ),
        .target(
            name: "MapboxDirectionsObjc",
            path: "MapboxDirectionsObjc"
        ),
        .testTarget(
            name: "MapboxDirectionsTests",
            dependencies: [
                "MapboxDirections",
                .product(name: "OHHTTPStubs", package: "OHHTTPStubs"),
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
            ],
            path: "MapboxDirectionsTests",
            resources: [.process("resources")]
        )
    ]
)
