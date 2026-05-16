import Foundation

/// The payload properties to clear geotargeting from a campaign.
public struct CampaignUpdate: Codable, Hashable, Sendable {
    /// The parameter to clear geotargeting from all ad groups in the campaign.
    ///
    /// To modify `countriesOrRegions` in a campaign,
    /// set the value of `clearGeoTargetingOnCountryOrRegionChange` to `true`.
    public let clearGeoTargetingOnCountryOrRegionChange: NullCodable<Bool>?
    /// The campaign properties to update.
    public let campaign: CampaignUpdateProperties?

    public init(
        clearGeoTargetingOnCountryOrRegionChange: NullCodable<Bool>? = nil,
        campaign: CampaignUpdateProperties? = nil
    ) {
        self.clearGeoTargetingOnCountryOrRegionChange = clearGeoTargetingOnCountryOrRegionChange
        self.campaign = campaign
    }
}
