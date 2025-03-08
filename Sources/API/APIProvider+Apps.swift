public extension APIProvider {
    /// Searches for iOS apps to promote in a campaign.
    ///
    /// - Parameters:
    ///     - parameters: Search parameters.
    ///
    /// - Returns: A paginated list of `AppInfo`.
    ///
    /// - Throws: An error of type `APIError`.
    func searchApps(parameters: SearchAppsRequestParameters) async throws -> Response<Paginated<AppInfo>> {
        try await provider.requestPaginatedModel(from: SearchAppsRequest(parameters: parameters))
    }

    /// Fetches app eligibility records by adam ID.
    ///
    /// - Parameters:
    ///     - adamId: A unique App Store app identifier.
    ///     - selector: `Selector` objects define what data the API returns when fetching resources.
    ///     - decoding: Custom model to decode when filtering the returned fields using `Selector.fields` property.
    ///     Omit this if no fields are being filtered out, which will result in decoding `EligibilityRecord` type.
    ///
    /// - Returns: A paginated list of `Model`.
    ///
    /// - Throws: An error of type `APIError`.
    func appEligibility<Model: Decodable & Sendable>(
        adamId: Int,
        selector: Selector<EligibilityRecord>? = nil,
        decoding: Model.Type = EligibilityRecord.self
    ) async throws -> Response<Paginated<Model>> {
        try await provider.requestPaginatedModel(from: AppEligibilityRequest(
            adamId: adamId,
            selector: selector
        ))
    }

    /// Fetches app metadata.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///
    /// - Returns: An object of type `AppDetails`.
    ///
    /// - Throws: An error of type `APIError`.
    func appDetails(adamId: Int) async throws -> Response<AppDetails> {
        try await provider.requestDataModel(from: AppDetailsRequest(adamId: adamId))
    }

    /// Fetches the localized default product page for an app.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     - parameters: Detailed app asset details of a device.
    ///
    /// - Returns: An object of type `AppLocaleDetails`.
    ///
    /// - Throws: An error of type `APIError`.
    func appLocaleDetails(
        adamId: Int,
        parameters: AppLocaleDetailsParameters? = nil
    ) async throws -> Response<AppLocaleDetails> {
        try await provider.requestDataModel(from: AppLocaleDetailsRequest(
            adamId: adamId,
            parameters: parameters
        ))
    }
}
