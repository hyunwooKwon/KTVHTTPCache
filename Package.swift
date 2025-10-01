// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.11)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            // 타겟 소스 디렉터리들만 명시
            path: ".",
            sources: [
                "KTVHTTPCache/Classes",
                "KTVCHTTPServer",
                "Vendors/CocoaAsyncSocket",
                "Vendors/CocoaHTTPServer/Core",
                "Vendors/CocoaHTTPServer/Extensions"
            ],
            // Classes 아래의 공개 헤더들을 그대로 공개
            publicHeadersPath: "KTVHTTPCache/Classes",
            cSettings: [
                // 헤더 탐색 경로
                .headerSearchPath("KTVHTTPCache/Classes"),
                .headerSearchPath("KTVCHTTPServer"),
                .headerSearchPath("Vendors"),
                .headerSearchPath("Vendors/CocoaAsyncSocket/Source/GCD"),
                .headerSearchPath("Vendors/CocoaHTTPServer"),
                .headerSearchPath("Vendors/CocoaHTTPServer/Core"),
                .headerSearchPath("Vendors/CocoaHTTPServer/Extensions")
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration")
            ]
        )
    ]
)