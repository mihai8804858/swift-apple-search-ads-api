public extension APIProvider {
    /// Creates a creative object within an organization.
    ///
    /// - Parameters:
    ///     - creative: Details of the creative.
    ///
    /// - Returns: A object of type `CreativeCustomProductPage`.
    ///
    /// - Throws: An error of type `APIError`.
    func createCreative(creative: CreativeCustomProductPage) async throws -> Response<CreativeCustomProductPage> {
        try await provider.requestDataModel(from: CreativeCreateRequest(creative: creative))
    }

    /// Fetches a creative by identifier.
    ///
    /// - Parameters:
    ///     - creativeId: The unique identifier for a creative.
    ///     - parameters: Creative parameters.
    ///
    /// - Returns: A object of type `CreativeCustomProductPage`.
    ///
    /// - Throws: An error of type `APIError`.
    func getCreative(
        creativeId: Int,
        parameters: CreativeParameters
    ) async throws -> Response<CreativeCustomProductPage> {
        try await provider.requestDataModel(from: CreativeRequest(creativeId: creativeId, parameters: parameters))
    }

    /// Fetches all creatives within an organization.
    ///
    /// - Parameters:
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `CreativeCustomProductPage`.
    ///
    /// - Throws: An error of type `APIError`.
    func listCreatives(pagination: Pagination? = nil) async throws -> Response<Paginated<CreativeCustomProductPage>> {
        try await provider.requestPaginatedModel(from: CreativesListRequest(pagination: pagination))
    }

    /// Finds creatives within an organization.
    ///
    /// - Parameters:
    ///     - selector: Define what data the API returns when fetching resources.
    ///     - decoding: Custom model to decode when filtering the returned fields using `Selector.fields` property.
    ///     Omit this if no fields are being filtered out, which will result in
    ///     decoding `CreativeCustomProductPage` type.
    ///
    /// - Returns: A paginated list of `Model`.
    ///
    /// - Throws: An error of type `APIError`.
    func findCreatives<Model: Decodable & Sendable>(
        selector: Selector<CreativeCustomProductPage>? = nil,
        decoding: Model.Type = CreativeCustomProductPage.self
    ) async throws -> Response<Paginated<Model>> {
        try await provider.requestPaginatedModel(from: CreativesFindRequest(selector: selector))
    }
}
