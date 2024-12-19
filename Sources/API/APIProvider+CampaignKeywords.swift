public extension APIProvider {
    /// Creates negative keywords for a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - keywords: Campaign negative keyword details.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func createCampaignNegativeKeywords(
        campaignId: Int,
        keywords: [NegativeKeyword]
    ) async throws -> Response<Paginated<[NegativeKeyword]>> {
        try await provider.requestPaginatedModel(from: CampaignNegativeKeywordsCreateRequest(
            campaignId: campaignId,
            keywords: keywords
        ))
    }

    /// Updates negative keywords in a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - keywords: Campaign negative keyword details.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func updateCampaignNegativeKeywords(
        campaignId: Int,
        keywords: [NegativeKeyword]
    ) async throws -> Response<Paginated<[NegativeKeyword]>> {
        try await provider.requestPaginatedModel(from: CampaignNegativeKeywordsUpdateRequest(
            campaignId: campaignId,
            keywords: keywords
        ))
    }

    /// Deletes negative keywords from a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - keywordIds: Campaign negative keyword ids to delete.
    ///
    /// - Returns: Number of deleted campaign negative keywords.
    ///
    /// - Throws: An error of type `APIError`
    func deleteCampaignNegativeKeywords(campaignId: Int, keywordIds: [Int]) async throws -> Response<Int> {
        try await provider.requestDataModel(from: CampaignNegativeKeywordsDeleteRequest(
            campaignId: campaignId,
            keywordIds: keywordIds
        ))
    }

    /// Fetches a specific negative keyword in a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - keywordId: The unique identifier for the keyword.
    ///
    /// - Returns: A object of type `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func getCampaignNegativeKeyword(campaignId: Int, keywordId: Int) async throws -> Response<NegativeKeyword> {
        try await provider.requestDataModel(from: CampaignNegativeKeywordRequest(
            campaignId: campaignId,
            keywordId: keywordId
        ))
    }

    /// Fetches all negative keywords in a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func listCampaignNegativeKeywords(
        campaignId: Int,
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<NegativeKeyword>> {
        try await provider.requestPaginatedModel(from: CampaignNegativeKeywordsListRequest(
            campaignId: campaignId,
            pagination: pagination
        ))
    }

    /// Fetches negative keywords for campaigns.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A object of type `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func findCampaignNegativeKeywords(
        campaignId: Int,
        selector: Selector? = nil
    ) async throws -> Response<Paginated<NegativeKeyword>> {
        try await provider.requestPaginatedModel(from: CampaignNegativeKeywordsFindRequest(
            campaignId: campaignId,
            selector: selector
        ))
    }
}
