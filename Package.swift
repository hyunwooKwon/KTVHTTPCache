// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        // CocoaAsyncSocket (벤더)
        .target(
            name: "CocoaAsyncSocket",
            path: "Vendors/CocoaAsyncSocket/Source",
            publicHeadersPath: "."
        ),

        // KTVHTTPCache 본체
        .target(
            name: "KTVHTTPCache",
            path: ".",                                // ← 패키지 루트 기준
            publicHeadersPath: "KTVHTTPCache/Classes",// ← 공개 헤더 위치
            exclude: [
                "demo",
                "documents",
                "Framework",
                "README.md",
                "README_CN.md",
                "KTVHTTPCache.podspec"
            ],
            cSettings: [
                // <KTVHTTPCache/...> 포함이 가능하도록 검색 루트를 루트로
                .headerSearchPath("."),
                .headerSearchPath("KTVHTTPCache/Classes"),
                .headerSearchPath("Vendors/CocoaAsyncSocket/Source")
            ],
            dependencies: ["CocoaAsyncSocket"]
        )
    ]
)