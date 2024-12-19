public extension APIProvider {
    /// Creates negative keywords in a specific ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywords: Ad group negative keyword details.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func createAdGroupNegativeKeywords(
        campaignId: Int,
        adGroupId: Int,
        keywords: [NegativeKeyword]
    ) async throws -> Response<Paginated<[NegativeKeyword]>> {
        try await provider.requestPaginatedModel(from: AdGroupNegativeKeywordsCreateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywords: keywords
        ))
    }

    /// Updates negative keywords in an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywords: Ad group negative keyword details.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func updateAdGroupNegativeKeywords(
        campaignId: Int,
        adGroupId: Int,
        keywords: [NegativeKeyword]
    ) async throws -> Response<Paginated<[NegativeKeyword]>> {
        try await provider.requestPaginatedModel(from: AdGroupNegativeKeywordsUpdateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywords: keywords
        ))
    }

    /// Deletes negative keywords from an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywordIds: Ad group negative keyword ids to delete.
    ///
    /// - Returns: Number of deleted campaign negative keywords.
    ///
    /// - Throws: An error of type `APIError`
    func deleteAdGroupNegativeKeywords(
        campaignId: Int,
        adGroupId: Int,
        keywordIds: [Int]
    ) async throws -> Response<Int> {
        try await provider.requestDataModel(from: AdGroupNegativeKeywordsDeleteRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywordIds: keywordIds
        ))
    }

    /// Fetches a specific negative keyword in an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywordId: The unique identifier for the keyword.
    ///
    /// - Returns: A object of type `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func getAdGroupNegativeKeyword(
        campaignId: Int,
        adGroupId: Int,
        keywordId: Int
    ) async throws -> Response<NegativeKeyword> {
        try await provider.requestDataModel(from: AdGroupNegativeKeywordRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywordId: keywordId
        ))
    }

    /// Fetches all negative keywords in ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func listAdGroupNegativeKeywords(
        campaignId: Int,
        adGroupId: Int,
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<NegativeKeyword>> {
        try await provider.requestPaginatedModel(from: AdGroupNegativeKeywordsListRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            pagination: pagination
        ))
    }

    /// Fetches negative keywords in a campaign’s ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A object of type `NegativeKeyword`.
    ///
    /// - Throws: An error of type `APIError`
    func findAdGroupNegativeKeywords(
        campaignId: Int,
        selector: Selector? = nil
    ) async throws -> Response<Paginated<NegativeKeyword>> {
        try await provider.requestPaginatedModel(from: AdGroupNegativeKeywordsFindRequest(
            campaignId: campaignId,
            selector: selector
        ))
    }
}
