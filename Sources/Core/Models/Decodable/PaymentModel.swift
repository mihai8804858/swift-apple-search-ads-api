/// The payment model that you set through the Apple Search Ads UI.
/// If you don’t set a payment model, campaigns can’t run.
public enum PaymentModel: String, Decodable, Equatable, Sendable {
    /// A pay-as-you-go payment model.
    case payAsYouGo = "PAYG"
    /// A line-of-credit payment model.
    case lineOfCredit = "LOC"
    /// There is no set payment method. If you don’t select a payment model, you can still create campaigns.
    /// You must select a payment model before a campaign is eligible to run.
    case none = ""
}
