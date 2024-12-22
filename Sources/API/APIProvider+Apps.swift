public extension APIProvider {
    /// Searches for iOS apps to promote in a campaign.
    ///
    /// - Parameters:
    ///     - parameters: Search parameters.
    ///
    /// - Returns: A paginated list of `AppInfo`.
    ///
    /// - Throws: An error of type `APIError`.
    func searchApps(parameters: SearchAppsRequestParameters) async throws -> Response<Paginated<[AppInfo]>> {
        try await provider.requestPaginatedModel(from: SearchAppsRequest(parameters: parameters))
    }

    /// Fetches app eligibility records by adam ID.
    ///
    /// - Parameters:
    ///     - adamId: A unique App Store app identifier.
    ///     - selector: `Selector` objects define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `EligibilityRecord`.
    ///
    /// - Throws: An error of type `APIError`.
    func appEligibility(
        adamId: Int,
        selector: Selector? = nil
    ) async throws -> Response<Paginated<[EligibilityRecord]>> {
        try await provider.requestPaginatedModel(from: AppEligibilityRequest(
            adamId: adamId,
            selector: selector
        ))
    }
}
