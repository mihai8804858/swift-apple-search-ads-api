/// The type of pricing model for a bid.
///
/// Apple Search Ads Campaign Management API 4.4 deprecates CPM.
/// You can’t update CPM campaigns to CPC campaigns. You need to use CPC when creating a new campaign.
/// See section 4.4 in Apple Search Ads Campaign Management API 4 for additional details.
public enum PricingModel: String, Codable, Equatable, Sendable {
    /// The average cost for each ad tap in a campaign.
    case cpc = "CPC"
    /// The cost per 1000 impressions in a campaign.
    case cpm = "CPM"
}
