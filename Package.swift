// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            path: ".",
            // ⬇️ 실제 들어있는 경로들만 포함
            sources: [
                "KTVHTTPCache/Classes",
                "KTVHTTPCache/CocoaHTTPServer",
                "Vendors/CocoaAsyncSocket"
            ],
            publicHeadersPath: "KTVHTTPCache",   // KTVHTTPCache.h 위치
            exclude: [
                "demo", "documents", "Framework",
                "README.md", "README_CN.md", "KTVHTTPCache.podspec"
            ],
            cSettings: [
                // KTV 헤더를 서로 찾게
                .headerSearchPath("KTVHTTPCache"),
                // CocoaHTTPServer 하위경로 전부
                .headerSearchPath("KTVHTTPCache/CocoaHTTPServer"),
                .headerSearchPath("KTVHTTPCache/CocoaHTTPServer/Categories"),
                .headerSearchPath("KTVHTTPCache/CocoaHTTPServer/Mime"),
                .headerSearchPath("KTVHTTPCache/CocoaHTTPServer/Responses"),
                // GCDAsyncSocket 헤더
                .headerSearchPath("Vendors/CocoaAsyncSocket")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)