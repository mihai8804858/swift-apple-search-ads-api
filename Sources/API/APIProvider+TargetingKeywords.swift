public extension APIProvider {
    /// Creates targeting keywords in ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywords: Targeting keyword details.
    ///
    /// - Returns: A paginated list of `Keyword`.
    ///
    /// - Throws: An error of type `APIError`
    func createTargetingKeywords(
        campaignId: Int,
        adGroupId: Int,
        keywords: [Keyword]
    ) async throws -> Response<Paginated<[Keyword]>> {
        try await provider.requestPaginatedModel(from: TargetingKeywordsCreateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywords: keywords
        ))
    }

    /// Updates targeting keywords in ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywords: Targeting keyword details.
    ///
    /// - Returns: A paginated list of `Keyword`.
    ///
    /// - Throws: An error of type `APIError`
    func updateTargetingKeywords(
        campaignId: Int,
        adGroupId: Int,
        keywords: [KeywordUpdate]
    ) async throws -> Response<Paginated<[Keyword]>> {
        try await provider.requestPaginatedModel(from: TargetingKeywordsUpdateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywords: keywords
        ))
    }

    /// Deletes targeting keywords from ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywordIds: Targeting keyword ids to delete.
    ///
    /// - Returns: Number of deleted targeting keywords.
    ///
    /// - Throws: An error of type `APIError`
    func deleteTargetingKeywords(campaignId: Int, adGroupId: Int, keywordIds: [Int]) async throws -> Response<Int> {
        try await provider.requestDataModel(from: TargetingKeywordsDeleteRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywordIds: keywordIds
        ))
    }

    /// Deletes a targeting keyword in an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywordId: The unique identifier for the keyword.
    ///
    /// - Returns: Empty response.
    ///
    /// - Throws: An error of type `APIError`
    func deleteTargetingKeyword(campaignId: Int, adGroupId: Int, keywordId: Int) async throws -> Response<Empty> {
        try await provider.requestDataModel(from: TargetingKeywordDeleteRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywordId: keywordId
        ))
    }

    /// Fetches a specific targeting keyword in an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - keywordId: The unique identifier for the keyword.
    ///
    /// - Returns: A object of type `Keyword`.
    ///
    /// - Throws: An error of type `APIError`
    func getTargetingKeyword(campaignId: Int, adGroupId: Int, keywordId: Int) async throws -> Response<Keyword> {
        try await provider.requestDataModel(from: TargetingKeywordRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            keywordId: keywordId
        ))
    }

    /// Fetches all targeting keywords in ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `Keyword`.
    ///
    /// - Throws: An error of type `APIError`
    func listTargetingKeywords(
        campaignId: Int,
        adGroupId: Int,
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<Keyword>> {
        try await provider.requestPaginatedModel(from: TargetingKeywordsListRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            pagination: pagination
        ))
    }

    /// Fetches targeting keywords in a campaign’s ad groups.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A object of type `Keyword`.
    ///
    /// - Throws: An error of type `APIError`
    func findTargetingKeywords(
        campaignId: Int,
        selector: Selector? = nil
    ) async throws -> Response<Paginated<Keyword>> {
        try await provider.requestPaginatedModel(from: TargetingKeywordsFindRequest(
            campaignId: campaignId,
            selector: selector
        ))
    }
}
