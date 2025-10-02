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
        // 1) CocoaAsyncSocket 타깃
        .target(
            name: "CocoaAsyncSocket",
            path: "KTVHTTPCache/Vendors/CocoaAsyncSocket",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),

        // 2) CocoaHTTPServer 타깃 (AsyncSocket 의존)
        .target(
            name: "CocoaHTTPServer",
            path: "KTVHTTPCache/CocoaHTTPServer",
            publicHeadersPath: ".",
            dependencies: ["CocoaAsyncSocket"],
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Categories"),
                .headerSearchPath("Mime"),
                .headerSearchPath("Responses")
            ]
        ),

        // 3) KTVHTTPCache 본체 타깃 (HTTPServer 의존)
        .target(
            name: "KTVHTTPCache",
            path: "KTVHTTPCache/Classes",
            publicHeadersPath: ".",
            dependencies: ["CocoaHTTPServer"],
            cSettings: [
                .headerSearchPath("."),                 // KTVHTTPCache/Classes
                .define("OS_OBJECT_USE_OBJC", to: "1", .when(platforms: [.iOS, .tvOS, .macOS]))
            ]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)