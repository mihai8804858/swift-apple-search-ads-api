struct ImpressionShareReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(reportId: Int) {
        path = "/api/v5/custom-reports/\(reportId)"
    }
}
