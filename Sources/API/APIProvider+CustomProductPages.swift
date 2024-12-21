public extension APIProvider {
    /// Fetches metadata of all your custom product pages.
    ///
    /// - Parameters:
    ///     - adamId: The unique identifier for the ad group.
    ///     - name: Filters by name field. For example, the name of your custom product page on App Store Connect.
    ///     - state: Filters by state, which indicates whether the product page is visible or not.
    ///
    /// - Returns: A list of `ProductPageDetail`.
    ///
    /// - Throws: An error of type `APIError`
    func getProductPages(
        adamId: Int,
        name: String? = nil,
        state: ProductPageDetail.State? = nil
    ) async throws -> Response<[ProductPageDetail]> {
        try await provider.requestDataModel(from: ProductPagesRequest(
            adamId: adamId,
            name: name,
            state: state
        ))
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
    /// - Throws: An error of type `APIError`
    func getProductPage(adamId: Int, productPageId: String) async throws -> Response<ProductPageDetail> {
        try await provider.requestDataModel(from: ProductPageRequest(adamId: adamId, productPageId: productPageId))
    }

    /// Fetches product page locales by identifier.
    ///
    /// - Parameters:
    ///     - adamId: Your unique App Store app identifier.
    ///     Your adamId in the resource path must match the adamId in your campaign.
    ///     - productPageId: A unique string to identify a product page on App Store Connect.
    ///     - deviceClasses: Filters by device type.
    ///     - languages: Filters by ISO alpha-2 country code, such as `US`.
    ///     - languageCodes: Filters by ISO 639-1 language code appended to the ISO alpha-2 country code.
    ///     The languageCodes parameter can have multiple values such as `en-US`, `fr-CA`.
    ///     - expand: Detailed app asset details of a device. Use `true` for expanded values in the API response.
    ///
    /// - Returns: An list of `ProductPageLocaleDetail`.
    ///
    /// - Throws: An error of type `APIError`
    func getProductPageLocales(
        adamId: Int,
        productPageId: String,
        deviceClasses: DeviceClass? = nil,
        languages: [String]? = nil,
        languageCodes: [String]? = nil,
        expand: Bool? = nil
    ) async throws -> Response<[ProductPageLocaleDetail]> {
        try await provider.requestDataModel(from: ProductPageLocalesRequest(
            adamId: adamId,
            productPageId: productPageId,
            deviceClasses: deviceClasses,
            languages: languages,
            languageCodes: languageCodes,
            expand: expand
        ))
    }

    /// Fetches supported languages and language codes.
    ///
    /// - Parameters:
    ///     - countriesOrRegions: Filters by ISO alpha-2 country codes using one or more comma-separated values.
    ///
    /// - Returns: An list of `CountryOrRegion`.
    ///
    /// - Throws: An error of type `APIError`
    func getSupportedCountriesOrRegions(
        countriesOrRegions: [String]
    ) async throws -> Response<[CountryOrRegion]> {
        try await provider.requestDataModel(from: SupportedCountriesOrRegionsRequest(
            countriesOrRegions: countriesOrRegions
        ))
    }

    /// Fetches supported app preview device-size mappings.
    ///
    /// - Returns: The app preview device mapping to display name and size mapping.
    /// The key is the identifier and the value is the display name.
    /// You can also use this to define the supported fallback devices if mapping isn’t available.
    ///
    /// - Throws: An error of type `APIError`
    func getAppPreviewDeviceSizes() async throws -> Response<[String: String]> {
        try await provider.requestDataModel(from: AppPreviewDeviceSizesRequest())
    }
}
