// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v12), .tvOS(.v12), .macOS(.v10_13)
    ],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            // 👇 네 레포의 폴더 구조 그대로 맞춰서 사용
            path: "KTVHTTPCache",
            // 이 세 폴더 안의 .m 파일들을 전부 같은 타깃으로 컴파일
            sources: [
                "Classes",
                "CocoaHTTPServer",
                "Vendors/CocoaAsyncSocket"
            ],
            // 공개 헤더(umbrella 포함)가 있는 곳
            publicHeadersPath: "Classes",
            // Obj-C가 서로를 찾을 수 있도록 헤더 검색 경로 추가
            cSettings: [
                .headerSearchPath("Classes"),
                .headerSearchPath("CocoaHTTPServer"),
                .headerSearchPath("CocoaHTTPServer/Categories"),
                .headerSearchPath("CocoaHTTPServer/Mime"),
                .headerSearchPath("CocoaHTTPServer/Responses"),
                .headerSearchPath("Vendors/CocoaAsyncSocket")
            ]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)