// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TreeSitter",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TreeSitter",
            targets: ["TreeSitter"]),
    ],
    targets: [
        .target(name: "TreeSitter",
                path: "lib",
                exclude: [
                  "src/wasm",
                  "src/lib.c",
                  ],
                sources: [
                  "src"
                ],
                publicHeadersPath: "include",
                cSettings: [
                  .define("_POSIX_C_SOURCE", to: "200112L", .when(platforms: [.linux, .android, .wasi, .windows, .openbsd])),
                ])
    ],
    cLanguageStandard: .c11
)
                        
