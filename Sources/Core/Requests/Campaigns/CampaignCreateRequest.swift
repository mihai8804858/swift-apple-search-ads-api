struct CampaignCreateRequest: RequestType {
    let path = "/api/v5/campaigns"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(campaign: Campaign) {
        body = .json(campaign)
    }
}
