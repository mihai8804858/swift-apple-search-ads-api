struct SearchTermReportRequest: RequestType {
    let path: String
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int?, request: ReportingRequest<ReportingSearchTerm>) {
        body = .json(request)
        if let adGroupId {
            path = "/api/v5/reports/campaigns/\(campaignId)/adgroups/\(adGroupId)/searchterms"
        } else {
            path = "/api/v5/reports/campaigns/\(campaignId)/searchterms"
        }
    }
}
