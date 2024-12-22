public extension APIProvider {
    /// Fetches metadata of all your custom product pages.
    ///
    /// - Parameters:
    ///     - adamId: The unique identifier for the ad group.
    ///     - parameters: Product pages parameters.
    ///
    /// - Returns: A list of `ProductPageDetail`.
    ///
    /// - Throws: An error of type `APIError`.
    func getProductPages(
        adamId: Int,
        parameters: ProductPagesParameters
    ) async throws -> Response<[ProductPageDetail]> {
        try await provider.requestDataModel(from: ProductPagesRequest(adamId: adamId, parameters: parameters))
    }

    /// Fetches metadata for a specific product page.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     Your `adamId` in the resource path must match the `adamId` in your campaign.
    ///     - productPageId: A unique string to identify a product page on App Store Connect.
    ///
    /// - Returns: An object of type `ProductPageDetail`.
    ///
    /// - Throws: An error of type `APIError`.
    func getProductPage(adamId: Int, productPageId: String) async throws -> Response<ProductPageDetail> {
        try await provider.requestDataModel(from: ProductPageRequest(adamId: adamId, productPageId: productPageId))
    }

    /// Fetches product page locales by identifier.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     Your adamId in the resource path must match the adamId in your campaign.
    ///     - productPageId: A unique string to identify a product page on App Store Connect.
    ///     - parameters: Product page locales parameters.
    ///
    /// - Returns: An list of `ProductPageLocaleDetail`.
    ///
    /// - Throws: An error of type `APIError`.
    func getProductPageLocales(
        adamId: Int,
        productPageId: String,
        parameters: ProductPageLocalesParameters
    ) async throws -> Response<[ProductPageLocaleDetail]> {
        try await provider.requestDataModel(from: ProductPageLocalesRequest(
            adamId: adamId,
            productPageId: productPageId,
            parameters: parameters
        ))
    }

    /// Fetches supported languages and language codes.
    ///
    /// - Parameters:
    ///     - parameters: Supported countries or regions parameters.
    ///
    /// - Returns: An list of `CountryOrRegion`.
    ///
    /// - Throws: An error of type `APIError`.
    func getSupportedCountriesOrRegions(
        parameters: SupportedCountriesOrRegionsParameters
    ) async throws -> Response<[CountryOrRegion]> {
        try await provider.requestDataModel(from: SupportedCountriesOrRegionsRequest(parameters: parameters))
    }

    /// Fetches supported app preview device-size mappings.
    ///
    /// - Returns: The app preview device mapping to display name and size mapping.
    /// The key is the identifier and the value is the display name.
    /// You can also use this to define the supported fallback devices if mapping isn’t available.
    ///
    /// - Throws: An error of type `APIError`.
    func getAppPreviewDeviceSizes() async throws -> Response<[String: String]> {
        try await provider.requestDataModel(from: AppPreviewDeviceSizesRequest())
    }
}
