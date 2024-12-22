struct CampaignListRequest: RequestType {
    let path = "/api/v5/campaigns"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(pagination: Pagination?) {
        query = RequestQuery(pagination)
    }
}
