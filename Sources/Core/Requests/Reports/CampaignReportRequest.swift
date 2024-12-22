struct CampaignReportRequest: RequestType {
    let path = "/api/v5/reports/campaigns"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(request: ReportingRequest) {
        body = .json(request)
    }
}
