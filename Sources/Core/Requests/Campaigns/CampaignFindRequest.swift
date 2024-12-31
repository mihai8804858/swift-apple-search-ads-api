struct CampaignFindRequest: RequestType {
    let path = "/api/v5/campaigns/find"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(selector: Selector<Campaign>?) {
        body = .json(selector)
    }
}
