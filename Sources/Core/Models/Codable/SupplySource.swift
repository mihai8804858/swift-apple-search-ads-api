/// The ad placements for a campaign.
///
/// Use the following combination of campaign and ad group values for supplySources.
/// | Ad channel type | Supply source | Billing event | Pricing model |
/// | --- | --- | --- | --- |
/// | Search | APPSTORE_SEARCH_RESULTS | Taps | CPC |
/// | Display | APPSTORE_TODAY_TAB | Taps | CPC |
/// | Display | APPSTORE_SEARCH_TAB | Taps | CPC |
/// | Display | APPSTORE_PRODUCT_PAGES_BROWSE | Taps | CPC |
public enum SupplySource: String, Codable, Hashable, Sendable {
    /// Reaches users when they’re browsing apps across the App Store.
    ///
    /// Your ad appears at the top of the You Might Also Like list when users scroll to the bottom of relevant pages
    /// across the App Store. An optional AppCategoryCriteria targeting dimension is eligible to use with the
    /// APPSTORE_PRODUCT_PAGES_BROWSE supply source. See the Discussion section for the combination of campaign
    /// and ad group values to use in campaign payloads with APPSTORE_PRODUCT_PAGES_BROWSE.
    case appStoreProductPagesBrowse = "APPSTORE_PRODUCT_PAGES_BROWSE"
    /// The campaign runs in App Store search results.
    ///
    /// See the Discussion section for the combination of campaign and ad group values to use in campaign payloads
    /// with APPSTORE_SEARCH_RESULTS.
    case appStoreSearchResults = "APPSTORE_SEARCH_RESULTS"
    /// The campaign runs on the App Store Search tab.
    ///
    /// See the Discussion section for the combination of campaign and ad group values to use in campaign payloads
    /// with APPSTORE_SEARCH_TAB. Ad group validations include:
    /// - You can’t use a cpaGoal.
    /// - You can’t use keywords.
    /// - You can’t use the daypart targeting dimension.
    /// - Search Match (automatedKeywordsOptIn) can’t be true.
    case appStoreSearchTab = "APPSTORE_SEARCH_TAB"
    /// See the Today tab compatibility subsection.
    case appStoreTodayTab = "APPSTORE_TODAY_TAB"
}
