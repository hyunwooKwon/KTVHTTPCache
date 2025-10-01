// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            // 레포 루트가 소스 루트
            path: ".",
            // 데모/문서 등 빌드 제외
            exclude: ["demo", "documents", "Framework", "README.md", "README_CN.md", "KTVHTTPCache.podspec"],
            // ObjC 소스가 들어있는 디렉터리들
            sources: [
                "KTVHTTPCache/Classes",
                "Vendors/CocoaAsyncSocket" // GCDAsyncSocket 포함
            ],
            // 공개 헤더는 루트의 KTVHTTPCache 폴더 (여기에 KTVHTTPCache.h 있음)
            publicHeadersPath: "KTVHTTPCache",
            cSettings: [
                .headerSearchPath("KTVHTTPCache"),
                .headerSearchPath("KTVHTTPCache/Classes"),
                .headerSearchPath("Vendors/CocoaAsyncSocket/Source")
            ]
        )
    ]
)