struct ImpressionShareReportListRequest: RequestType {
    let path = "/api/v5/custom-reports"
    let method = HTTPMethod.get
    let task: RequestTask

    init(sorting: Sorting?, pagination: Pagination?) {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "field": sorting?.field,
                "sortOrder": sorting?.sortOrder.rawValue,
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
