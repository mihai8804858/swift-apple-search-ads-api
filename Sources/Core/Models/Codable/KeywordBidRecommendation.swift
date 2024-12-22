/// The suggested bid amount for a keyword.
public struct KeywordBidRecommendation: Codable, Equatable, Sendable {
    /// An indicator that varies over time to help you incrementally increase the likelihood of your ad showing
    /// in searches in the App Store.
    ///
    /// A `suggestedBidAmount` isn’t a representation of a bid floor or ceiling. A `suggestedBidAmount` is based on
    /// various factors, including, but not limited to, historical data related to past performance and recommendations.
    /// Actual outcomes, including changes in spend and average CPA, may vary.
    public let suggestedBidAmount: Money

    public init(suggestedBidAmount: Money) {
        self.suggestedBidAmount = suggestedBidAmount
    }
}
