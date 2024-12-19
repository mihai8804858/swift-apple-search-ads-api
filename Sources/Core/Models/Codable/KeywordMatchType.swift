/// An automated keyword and bidding strategy.
public enum KeywordMatchType: String, Codable, Equatable, Sendable {
    /// Use this value to ensure your ads don’t run on relevant, close variants of a keyword,
    /// such as singulars, plurals, misspellings, synonyms, related searches, and phrases
    /// that include that term (fully or partially).
    case broad = "BROAD"
    /// Use this value for the most control over searches your ad may appear in.
    /// You can target a specific term and its close variants, such as common misspellings and plurals.
    /// Your ad may receive fewer impressions as a result, but your tap-through rates (TTRs) and conversions
    /// on those impressions may be higher because you’re reaching users most interested in your app.
    case exact = "EXACT"
}
