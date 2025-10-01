// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v11), .tvOS(.v11), .macOS(.v10_13)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            path: "",
            // ⚠️ umbrella header가 있는 곳을 public 헤더 경로로
            publicHeadersPath: "Framework",
            // 실제 구현 소스가 있는 곳
            sources: [
                "KTVHTTPCache/Classes"
            ],
            cSettings: [
                // 클래스/벤더 헤더 탐색 경로
                .headerSearchPath("KTVHTTPCache/Classes"),
                .headerSearchPath("Vendors/CocoaAsyncSocket/Source")
            ]
        )
    ]
)