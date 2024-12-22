struct AdGroupListRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(campaignId: Int, pagination: Pagination?) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups"
        query = RequestQuery(pagination)
    }
}
