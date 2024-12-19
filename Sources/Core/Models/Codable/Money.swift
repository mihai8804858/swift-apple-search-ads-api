/// The response to requests for budget amounts in campaigns.
public struct Money: Codable, Equatable, Sendable {
    /// The monetary value in the specified currency.
    /// The API uses amount whenever a currency value is necessary.
    /// The string can contain up to two decimal digits.
    public let amount: String
    /// The organization’s default currency that is set up in the Apple Search Ads UI.
    public let currency: String

    public init(amount: String, currency: String) {
        self.amount = amount
        self.currency = currency
    }
}
