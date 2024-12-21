import Foundation

/// The payload properties to clear geotargeting from a campaign.
public struct CampaignUpdate: Codable, Equatable, Sendable {
    /// The campaign properties to update.
    public let campaign: CampaignUpdateProperties?
    /// The parameter to clear geotargeting from all ad groups in the campaign.
    ///
    /// To modify `countriesOrRegions` in a campaign,
    /// set the value of `clearGeoTargetingOnCountryOrRegionChange` to `true`.
    public let clearGeoTargetingOnCountryOrRegionChange: Bool?

    public init(
        campaign: CampaignUpdateProperties? = nil,
        clearGeoTargetingOnCountryOrRegionChange: Bool? = nil
    ) {
        self.campaign = campaign
        self.clearGeoTargetingOnCountryOrRegionChange = clearGeoTargetingOnCountryOrRegionChange
    }
}
