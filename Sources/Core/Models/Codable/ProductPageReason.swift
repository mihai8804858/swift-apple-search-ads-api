import Foundation

/// The ad creative rejection reason based on a product page.
public struct ProductPageReason: Codable, Equatable, Sendable, CodingKeysContaining {
    public enum ReasonType: String, Codable, Equatable, Sendable {
        case rejectionReason = "REJECTION_REASON"
    }

    /// The reason rejection code.
    public enum ReasonCode: String, Codable, Equatable, Sendable {
        /// Violent, offensive, sexually explicit, or otherwise inappropriate images aren’t allowed in the app icon.
        case appIconGraphicOrAdultThemedContent = "APP_ICON_GRAPHIC_OR_ADULT_THEMED_CONTENT"
        /// The app icon doesn’t comply with Apple advertising guidelines.
        case appIconNotEligible = "APP_ICON_NOT_ELIGIBLE"
        /// The language in the app name needs to match the language selected in App Store Connect.
        case appNameLanguageConflict = "APP_NAME_LANGUAGE_CONFLICT"
        /// Violent, offensive, sexually explicit, or otherwise inappropriate wording isn’t allowed in the app name.
        case appNameGraphicOrAdultThemedContent = "APP_NAME_GRAPHIC_OR_ADULT_THEMED_CONTENT"
        /// The app name doesn’t comply with Apple advertising guidelines.
        case appNameNotEligible = "APP_NAME_NOT_ELIGIBLE"
        /// The app isn’t eligible for promotion on the Today tab.
        case appNotEligibleAtThisTime = "APP_NOT_ELIGIBLE_AT_THIS_TIME"
        /// The phrases Game of the Day and App of the Day aren’t allowed in the app icon, name, or subtitle.
        case mimicsAppStoreTodayCard = "MIMICS_APP_STORE_TODAY_CARD"
        /// The app icon from a product page optimization experiment doesn’t comply with Apple Advertising guidelines.
        case ppoExperimentAppIconNotEligible = "PRODUCT_PAGE_OPTIMIZATION_EXPERIMENT_APP_ICON_NOT_ELIGIBLE"
        /// Violent, offensive, sexually explicit, or otherwise inappropriate wording isn’t allowed in the app subtitle.
        case subtitleGraphicOrAdultThemedContent = "SUBTITLE_GRAPHIC_OR_ADULT_THEMED_CONTENT"
        /// The language in the app subtitle needs to match the language of the primary locale in App Store Connect.
        case subtitleLanguageConflict = "SUBTITLE_LANGUAGE_CONFLICT"
        /// The app’s subtitle doesn’t comply with Apple Search Ads advertising requirements.
        case subtitleNotEligible = "SUBTITLE_NOT_ELIGIBLE"
        /// Pricing, offers, ranking, or other incentivized promotions aren’t allowed in the app subtitle.
        case subtitlePricingOffersOrRankingClaims = "SUBTITLE_PRICING_OFFERS_OR_RANKING_CLAIMS"
    }

    /// The rejection reason identifier.
    public let id: Int?
    /// Your unique App Store app identifier.
    public let adamId: Int?
    /// The custom product page identifier associated with the ad creative rejection reason.
    public let productPageId: String?
    /// TThe unique identifier for an app preview or screenshot.
    public let assetGenId: String?
    /// The ISO 639-1 language code appended to the ISO 3166-1 alpha-2 country code, such as en-US.
    public let languageCode: String?
    /// The reason rejection code.
    public let reasonCode: ReasonCode?
    /// The reason type has a value of `REJECTION_REASON`.
    public let reasonType: ReasonType?
    /// The level at which the system applies the rejection reason. See ReasonLevel for enumerations.
    public let reasonLevel: AdRejectionReasonLevel?
    /// The ad placement associated with the ad creative rejection reason.
    public let supplySource: SupplySource?
    /// The App Store geoterritories where you’re promoting your app.
    public let countryOrRegion: String?
    /// Custom comments from Apple about the rejection reason.
    public let comment: String?

    public init(
        id: Int? = nil,
        adamId: Int? = nil,
        productPageId: String? = nil,
        assetGenId: String? = nil,
        languageCode: String? = nil,
        reasonCode: ReasonCode? = nil,
        reasonType: ReasonType? = nil,
        reasonLevel: AdRejectionReasonLevel? = nil,
        supplySource: SupplySource? = nil,
        countryOrRegion: String? = nil,
        comment: String? = nil
    ) {
        self.id = id
        self.adamId = adamId
        self.productPageId = productPageId
        self.assetGenId = assetGenId
        self.languageCode = languageCode
        self.reasonCode = reasonCode
        self.reasonType = reasonType
        self.reasonLevel = reasonLevel
        self.supplySource = supplySource
        self.countryOrRegion = countryOrRegion
        self.comment = comment
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case adamId
        case productPageId
        case assetGenId
        case languageCode
        case reasonCode
        case reasonType
        case reasonLevel
        case supplySource
        case countryOrRegion
        case comment
    }
}
