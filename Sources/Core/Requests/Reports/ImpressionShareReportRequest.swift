struct ImpressionShareReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(reportId: Int) {
        path = "/api/v5/custom-reports/\(reportId)"
    }
}
