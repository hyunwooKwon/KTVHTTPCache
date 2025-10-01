// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "KTVHTTPCache",
            targets: ["KTVHTTPCache"]
        ),
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            path: "KTVHTTPCache/Classes",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("KTVHCCommon"),
                .headerSearchPath("KTVHCDataStorage"),
                .headerSearchPath("KTVHCDownload"),
                .headerSearchPath("KTVHCHTTPServer"),
                .headerSearchPath("KTVHCTools"),
            ]
        )
    ]
)
