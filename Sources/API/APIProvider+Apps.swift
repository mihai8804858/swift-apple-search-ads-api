public extension APIProvider {
    /// Searches for iOS apps to promote in a campaign.
    ///
    /// - Parameters:
    ///     - query: The query for a list of iOS apps using a matching prefix.
    ///     - returnOwnedApps: The list of apps belonging to your organization.
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `AppInfo`.
    ///
    /// - Throws: An error of type `APIError`.
    func searchApps(
        query: String? = nil,
        returnOwnedApps: Bool? = nil,
        pagination: Pagination? = nil
    ) async throws -> Response<Paginated<[AppInfo]>> {
        try await provider.requestPaginatedModel(from: SearchAppsRequest(
            query: query,
            returnOwnedApps: returnOwnedApps,
            pagination: pagination
        ))
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
