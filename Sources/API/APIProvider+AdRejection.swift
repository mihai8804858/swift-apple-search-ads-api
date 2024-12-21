public extension APIProvider {
    /// Fetches app asset metadata by adam ID.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `AppAsset`.
    ///
    /// - Throws: An error of type `APIError`
    func getAppAssets(adamId: Int, selector: Selector? = nil) async throws -> Response<Paginated<AppAsset>> {
        try await provider.requestPaginatedModel(from: AppAssetsFindRequest(adamId: adamId, selector: selector))
    }

    /// Fetches ad creative rejection reasons by custom product page ID.
    ///
    /// - Parameters:
    ///     - productPageReasonId: A unique identifier for a custom product page with
    ///     an associated ad creative rejection reason.
    ///
    /// - Returns: A paginated list of `ProductPageReason`.
    ///
    /// - Throws: An error of type `APIError`
    func getAdCreativeRejectionReasons(
        productPageReasonId: Int
    ) async throws -> Response<Paginated<ProductPageReason>> {
        try await provider.requestPaginatedModel(from: AdCreativeRejectionReasonsRequest(
            productPageReasonId: productPageReasonId
        ))
    }

    /// Fetches ad creative rejection reasons.
    ///
    /// - Parameters:
    ///     - selector: Define what data the API returns when fetching resources.
    ///
    /// - Returns: A paginated list of `ProductPageReason`.
    ///
    /// - Throws: An error of type `APIError`
    func findAdCreativeRejectionReasons(
        selector: Selector? = nil
    ) async throws -> Response<Paginated<ProductPageReason>> {
        try await provider.requestPaginatedModel(from: AdCreativeRejectionReasonsFindRequest(
            selector: selector
        ))
    }
}
