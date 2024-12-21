public extension APIProvider {
    /// Creates a campaign to promote an app.
    ///
    /// - Parameters:
    ///     - campaign: Details of the campaign.
    ///
    /// - Returns: A object of type `Campaign`.
    ///
    /// - Throws: An error of type `APIError`
    ///
    /// Essential points for creating campaigns are:
    /// - Use Search for iOS apps to retrieve your `adamId` to use in the request payload.
    /// - Use Find App Eligibility to determine your app eligibility to run in campaigns.
    /// - A `dailyBudgetAmount` is a required field to manage the daily budget of your campaigns.
    /// Use an optional `budgetAmount` to manage your lifetime budget.
    /// - Use the `countriesOrRegions` attribute to assign App Store locations.
    /// To advertise in multiple markets, group countries and regions into a single campaign
    /// using ISO alpha-2 country code values.
    /// - See the `Campaign` object and `SupplySource` for descriptions of attributes.
    /// - After creating a campaign, set up Ad Groups.
    func createCampaign(campaign: Campaign) async throws -> Response<Campaign> {
        try await provider.requestDataModel(from: CampaignCreateRequest(campaign: campaign))
    }

    /// Updates a campaign with a campaign identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///     - campaign: Details of the campaign.
    ///
    /// - Returns: A object of type `Campaign`.
    ///
    /// - Throws: An error of type `APIError`
    ///
    /// Use this endpoint to update countries or regions (App Store geolocations) where you promote your app,
    /// and to set your campaign budget.
    func updateCampaign(campaignId: Int, campaign: CampaignUpdate) async throws -> Response<Campaign> {
        try await provider.requestDataModel(from: CampaignUpdateRequest(
            campaignId: campaignId,
            campaign: campaign
        ))
    }

    /// Deletes a specific campaign by campaign identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///
    /// - Returns: Empty response.
    ///
    /// - Throws: An error of type `APIError`
    func deleteCampaign(campaignId: Int) async throws -> Response<Empty> {
        try await provider.requestDataModel(from: CampaignDeleteRequest(campaignId: campaignId))
    }

    /// Fetches a specific campaign by campaign identifier.
    ///
    /// - Parameters:
    ///     - campaignId: The unique identifier for the campaign.
    ///
    /// - Returns: A object of type `Campaign`.
    ///
    /// - Throws: An error of type `APIError`
    ///
    /// Use this endpoint to return data for a specific campaign.
    func getCampaign(campaignId: Int) async throws -> Response<Campaign> {
        try await provider.requestDataModel(from: CampaignRequest(campaignId: campaignId))
    }

    /// Fetches all of an organization’s assigned campaigns.
    ///
    /// - Parameters:
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `Campaign`.
    ///
    /// - Throws: An error of type `APIError`
    ///
    /// This endpoint returns data for all of an organization’s assigned campaigns.
    func listCampaigns(pagination: Pagination? = nil) async throws -> Response<Paginated<Campaign>> {
        try await provider.requestPaginatedModel(from: CampaignListRequest(pagination: pagination))
    }

    /// Fetches campaigns with selector operators.
    ///
    /// - Parameters:
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `Campaign`.
    ///
    /// - Throws: An error of type `APIError`
    func findCampaigns(selector: Selector? = nil) async throws -> Response<Paginated<Campaign>> {
        try await provider.requestPaginatedModel(from: CampaignFindRequest(selector: selector))
    }
}
