struct AdGroupNegativeKeywordsUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(campaignId: Int, adGroupId: Int, keywords: [NegativeKeyword]) {
        path = "/api/v5/campaigns/\(campaignId)/adgroups/\(adGroupId)/negativekeywords/bulk"
        body = .json(keywords)
    }
}
