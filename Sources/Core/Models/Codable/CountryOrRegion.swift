/// The supported locales of a product page.
///
/// Countries and regions use ISO alpha-2 country codes.
/// Use the Get Supported Countries or Regions endpoint to fetch supported languages ands language codes.
public struct CountryOrRegion: Codable, Equatable, Sendable {
    /// The supported App Store territory of your product page.
    public let countryOrRegion: String?
    /// The default languages of assets to use for a campaign’s CountryOrRegion.
    public let defaultLanguages: [LocaleInfo]?
    /// The supported languages and languageCodes that you use on your product page.
    public let supportedLanguages: [LocaleInfo]?

    public init(
        countryOrRegion: String? = nil,
        defaultLanguages: [LocaleInfo]? = nil,
        supportedLanguages: [LocaleInfo]? = nil
    ) {
        self.countryOrRegion = countryOrRegion
        self.defaultLanguages = defaultLanguages
        self.supportedLanguages = supportedLanguages
    }
}
