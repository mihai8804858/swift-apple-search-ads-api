public extension APIProvider {
    /// Creates an ad in an ad group with a creative.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - ad: Details of the ad.
    ///
    /// - Returns: A object of type `Ad`.
    ///
    /// - Throws: An error of type `APIError`.
    func createAd(campaignId: Int, adGroupId: Int, ad: AdCreate) async throws -> Response<Ad> {
        try await provider.requestDataModel(from: AdCreateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            ad: ad
        ))
    }

    /// Updates an ad in an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - adId: A unique identifier representing the assignment relationship between an ad group and an ad.
    ///     - ad: Details of the ad.
    ///
    /// - Returns: A object of type `Ad`.
    ///
    /// - Throws: An error of type `APIError`.
    func updateAd(campaignId: Int, adGroupId: Int, adId: Int, ad: AdUpdate) async throws -> Response<Ad> {
        try await provider.requestDataModel(from: AdUpdateRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            adId: adId,
            ad: ad
        ))
    }

    /// Deletes an ad from an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - adId: A unique identifier representing the assignment relationship between an ad group and an ad.
    ///
    /// - Returns: An `Empty` response.
    ///
    /// - Throws: An error of type `APIError`.
    func deleteAd(campaignId: Int, adGroupId: Int, adId: Int, ad: AdUpdate) async throws -> Response<Empty> {
        try await provider.requestDataModel(from: AdDeleteRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            adId: adId
        ))
    }

    /// Fetches an ad assigned to an ad group by identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///     - adId: A unique identifier representing the assignment relationship between an ad group and an ad.
    ///
    /// - Returns: A object of type `Ad`.
    ///
    /// - Throws: An error of type `APIError`.
    func getAd(campaignId: Int, adGroupId: Int, adId: Int) async throws -> Response<Ad> {
        try await provider.requestDataModel(from: AdRequest(
            campaignId: campaignId,
            adGroupId: adGroupId,
            adId: adId
        ))
    }

    /// Fetches all ads assigned to an ad group.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - adGroupId: The unique identifier for the ad group.
    ///
    /// - Returns: A paginated list of `Ad`.
    ///
    /// - Throws: An error of type `APIError`.
    func listAds(campaignId: Int, adGroupId: Int) async throws -> Response<Paginated<Ad>> {
        try await provider.requestPaginatedModel(from: AdsListRequest(campaignId: campaignId, adGroupId: adGroupId))
    }

    /// Finds ads within a campaign by selector criteria.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - selector: `Selector` objects define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `Ad`.
    ///
    /// - Throws: An error of type `APIError`.
    func findAds(campaignId: Int? = nil, selector: Selector? = nil) async throws -> Response<Paginated<Ad>> {
        try await provider.requestPaginatedModel(from: AdsFindRequest(
            campaignId: campaignId,
            selector: selector
        ))
    }
}
