import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

class SnapshotTestCase: XCTestCase {
    let snapshotTestsProvider = Provider(
        baseURL: URL(string: "https://api.searchads.apple.com")!,
        plugins: [
            HostInjector(),
            AcceptHeadersInjector(),
            ContextInjector {
                [
                    UserACL(
                        orgId: 12345,
                        orgName: "My Organization",
                        parentOrgId: nil,
                        currency: "USD",
                        paymentModel: .payAsYouGo,
                        roleNames: ["Admin"],
                        timeZone: "UTC"
                    )
                ]
            },
            AuthorizationInjector {
                AccessToken(
                    token: "token",
                    tokenType: "Bearer",
                    expiresIn: 3600
                )
            }
        ]
    )

    override func invokeTest() {
        withSnapshotTesting(record: .missing) {
            super.invokeTest()
        }
    }

    func assertRequest<R: RequestType>(
        _ request: @autoclosure () throws -> R,
        message: @autoclosure () -> String = "",
        record isRecording: Bool? = nil,
        matches expected: (() -> String)? = nil,
        fileID: StaticString = #fileID,
        file filePath: StaticString = #filePath,
        function: StaticString = #function,
        line: UInt = #line,
        column: UInt = #column
    ) async throws {
        let request = try await snapshotTestsProvider.prepare(request: request())
        assertInlineSnapshot(
            of: request,
            as: .raw(pretty: true),
            message: message(),
            record: isRecording,
            matches: expected,
            fileID: fileID,
            file: filePath,
            function: function,
            line: line,
            column: column
        )
    }
}
