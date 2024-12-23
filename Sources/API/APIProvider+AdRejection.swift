public extension APIProvider {
    /// Fetches app asset metadata by adam ID.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     - selector: Define what data the API returns when fetching resources.
    ///     - decoding: Custom model to decode when filtering the returned fields using `Selector.fields` property.
    ///     Omit this if no fields are being filtered out, which will result in decoding `AppAsset` type.
    ///
    /// - Returns: A paginated list of `Model`.
    ///
    /// - Throws: An error of type `APIError`.
    func getAppAssets<Model: Decodable & Sendable>(
        adamId: Int,
        selector: Selector? = nil,
        decoding: Model.Type = AppAsset.self
    ) async throws -> Response<Paginated<Model>> {
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
    /// - Throws: An error of type `APIError`.
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
    ///     - decoding: Custom model to decode when filtering the returned fields using `Selector.fields` property.
    ///     Omit this if no fields are being filtered out, which will result in decoding `ProductPageReason` type.
    ///
    /// - Returns: A paginated list of `Model`.
    ///
    /// - Throws: An error of type `APIError`.
    func findAdCreativeRejectionReasons<Model: Decodable & Sendable>(
        selector: Selector? = nil,
        decoding: Model.Type = ProductPageReason.self
    ) async throws -> Response<Paginated<Model>> {
        try await provider.requestPaginatedModel(from: AdCreativeRejectionReasonsFindRequest(
            selector: selector
        ))
    }
}
