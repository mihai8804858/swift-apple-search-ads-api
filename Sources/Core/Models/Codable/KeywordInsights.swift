/// The object that contains bid recommendations.
///
/// A `bidRecommendation` helps you apply your bid strategy to exact match keywords and similar keywords in a broad
/// match. Use `bidRecommendation` to optimize campaign performance through your Search Match discovery campaigns.
public struct KeywordInsights: Codable, Equatable, Sendable {
    /// A bid recommendation for a keyword.
    public let bidRecommendation: KeywordBidRecommendation?

    public init(bidRecommendation: KeywordBidRecommendation? = nil) {
        self.bidRecommendation = bidRecommendation
    }
}
