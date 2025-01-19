import XCTest
@testable import AppleSearchAds

final class PagedResponseTests: XCTestCase {
    func testHalfSequence() async throws {
        let (pages, responses) = try await simulateResponses(pageSize: 20, totalResults: 110)

        XCTAssertEqual(pages, [
            Pagination(limit: 20, offset: 0),
            Pagination(limit: 20, offset: 20),
            Pagination(limit: 20, offset: 40),
            Pagination(limit: 20, offset: 60),
            Pagination(limit: 20, offset: 80),
            Pagination(limit: 20, offset: 100)
        ])

        XCTAssertEqual(responses, [
            Response(
                model: Paginated(
                    data: Array(0..<20),
                    pagination: PageDetail(totalResults: 110, startIndex: 0, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(20..<40),
                    pagination: PageDetail(totalResults: 110, startIndex: 20, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(40..<60),
                    pagination: PageDetail(totalResults: 110, startIndex: 40, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(60..<80),
                    pagination: PageDetail(totalResults: 110, startIndex: 60, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(80..<100),
                    pagination: PageDetail(totalResults: 110, startIndex: 80, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(100..<110),
                    pagination: PageDetail(totalResults: 110, startIndex: 100, itemsPerPage: 20)
                ),
                statusCode: .success
            )
        ])
    }

    func testFullSequence() async throws {
        let (pages, responses) = try await simulateResponses(pageSize: 20, totalResults: 120)

        XCTAssertEqual(pages, [
            Pagination(limit: 20, offset: 0),
            Pagination(limit: 20, offset: 20),
            Pagination(limit: 20, offset: 40),
            Pagination(limit: 20, offset: 60),
            Pagination(limit: 20, offset: 80),
            Pagination(limit: 20, offset: 100)
        ])

        XCTAssertEqual(responses, [
            Response(
                model: Paginated(
                    data: Array(0..<20),
                    pagination: PageDetail(totalResults: 120, startIndex: 0, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(20..<40),
                    pagination: PageDetail(totalResults: 120, startIndex: 20, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(40..<60),
                    pagination: PageDetail(totalResults: 120, startIndex: 40, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(60..<80),
                    pagination: PageDetail(totalResults: 120, startIndex: 60, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(80..<100),
                    pagination: PageDetail(totalResults: 120, startIndex: 80, itemsPerPage: 20)
                ),
                statusCode: .success
            ),
            Response(
                model: Paginated(
                    data: Array(100..<120),
                    pagination: PageDetail(totalResults: 120, startIndex: 100, itemsPerPage: 20)
                ),
                statusCode: .success
            )
        ])
    }

    // MARK: - Private

    private func simulateResponses(
        pageSize: Int,
        totalResults: Int
    ) async throws -> (pages: [Pagination], responses: [Response<Paginated<Int>>]) {
        nonisolated(unsafe) var pages: [Pagination] = []
        nonisolated(unsafe) var responses: [Response<Paginated<Int>>] = []
        let stream = PagedResponse(size: pageSize) { pagination in
            pages.append(pagination)
            if pagination.offset < totalResults {
                return Response<Paginated<Int>>(
                    model: Paginated<Int>(
                        data: Array(pagination.offset..<min(pagination.offset + pageSize, totalResults)),
                        pagination: PageDetail(
                            totalResults: totalResults,
                            startIndex: pagination.offset,
                            itemsPerPage: pageSize
                        )
                    ),
                    statusCode: .success
                )
            } else {
                return Response<Paginated<Int>>(
                    model: Paginated<Int>(
                        data: [],
                        pagination: PageDetail(
                            totalResults: totalResults,
                            startIndex: pagination.offset,
                            itemsPerPage: pageSize
                        )
                    ),
                    statusCode: .success
                )
            }
        }

        for try await response in stream {
            responses.append(response)
        }

        return (pages, responses)
    }
}
