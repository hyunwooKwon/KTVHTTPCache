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
            // ⬇️ 현재 구조에 맞게 소스 경로 지정
            sources: [
                "KTVHTTPCache/Classes",     // KTV 소스들
                "CocoaHTTPServer",          // 루트에 있는 CocoaHTTPServer
                "Vendors/CocoaAsyncSocket"  // GCDAsyncSocket
            ],
            // KTVHTTPCache.h 가 어디에 있든 노출은 여기 기준으로 할 거라 넉넉히 루트로
            publicHeadersPath: ".",
            exclude: [
                "demo", "documents", "Framework",
                "README.md", "README_CN.md", "KTVHTTPCache.podspec"
            ],
            cSettings: [
                // KTV 헤더
                .headerSearchPath("KTVHTTPCache"),
                .headerSearchPath("KTVHTTPCache/Classes"),
                // CocoaHTTPServer (루트)
                .headerSearchPath("CocoaHTTPServer"),
                .headerSearchPath("CocoaHTTPServer/Categories"),
                .headerSearchPath("CocoaHTTPServer/Mime"),
                .headerSearchPath("CocoaHTTPServer/Responses"),
                // GCDAsyncSocket
                .headerSearchPath("Vendors/CocoaAsyncSocket"),
                // 혹시 모를 상대 인클루드를 위해 루트도 추가
                .headerSearchPath(".")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)