public extension APIProvider {
    /// Creates an ad group as part of a campaign.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroup: Details of the ad group and campaign.
    ///
    /// - Returns: A object of type `AdGroup`.
    ///
    /// - Throws: An error of type `APIError`.
    func createAdGroup(campaignId: Int, adGroup: AdGroup) async throws -> Response<AdGroup> {
        try await provider.requestDataModel(from: AdGroupCreateRequest(campaignId: campaignId, adGroup: adGroup))
    }

    /// Updates an ad group with an ad group identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - adGroup: Details of the ad group and campaign.
    ///
    /// - Returns: A object of type `AdGroup`.
    ///
    /// - Throws: An error of type `APIError`.
    func updateAdGroup(campaignId: Int, adGroupId: Int, adGroup: AdGroupUpdate) async throws -> Response<AdGroup> {
        try await provider.requestDataModel(from: AdGroupUpdateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            adGroup: adGroup
        ))
    }

    /// Deletes an ad group with a campaign and ad group identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///
    /// - Returns: An `Empty` response.
    ///
    /// - Throws: An error of type `APIError`.
    func deleteAdGroup(campaignId: Int, adGroupId: Int) async throws -> Response<Empty> {
        try await provider.requestDataModel(from: AdGroupDeleteRequest(campaignId: campaignId, adGroupId: adGroupId))
    }

    /// Fetches a specific ad group with a campaign and ad group identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///
    /// - Returns: A object of type `BudgetOrderInfo`.
    ///
    /// - Throws: An error of type `APIError`.
    func getAdGroup(campaignId: Int, adGroupId: Int) async throws -> Response<AdGroup> {
        try await provider.requestDataModel(from: AdGroupRequest(campaignId: campaignId, adGroupId: adGroupId))
    }

    /// Fetches all ad groups with a campaign identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `AdGroup`.
    ///
    /// - Throws: An error of type `APIError`.
    func listAdGroups(campaignId: Int, pagination: Pagination? = nil) async throws -> Response<Paginated<AdGroup>> {
        try await provider.requestPaginatedModel(from: AdGroupListRequest(
            campaignId: campaignId,
            pagination: pagination
        ))
    }

    /// Fetches ad groups within a campaign or within an organization.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign. Pass `nil` to find within an organization.
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `AdGroup`.
    ///
    /// - Throws: An error of type `APIError`.
    func findAdGroups(campaignId: Int? = nil, selector: Selector? = nil) async throws -> Response<Paginated<AdGroup>> {
        try await provider.requestPaginatedModel(from: AdGroupFindRequest(campaignId: campaignId, selector: selector))
    }
}
