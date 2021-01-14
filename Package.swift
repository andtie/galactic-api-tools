// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "galactic-api-tools",
    products: [
        .library(name: "OpenAPI", targets: ["OpenAPI"]),
        .library(name: "OpenAPIDecoder", targets: ["OpenAPIDecoder"]),
        .library(name: "OpenAPIFaker", targets: ["OpenAPIFaker"])
    ],
    targets: [
        .target(
            name: "OpenAPI",
            dependencies: []
        ),
        .target(
            name: "OpenAPIDecoder",
            dependencies: [.target(name: "OpenAPI")]
        ),
        .target(
            name: "OpenAPIFaker",
            dependencies: [
                .target(name: "OpenAPI"),
                .target(name: "OpenAPIDecoder")
            ]
        ),
        .testTarget(
            name: "DecoderTests",
            dependencies: ["OpenAPIDecoder"]
        )
    ]
)
