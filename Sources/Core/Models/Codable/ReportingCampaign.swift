import Foundation

/// The response to a request to fetch campaign-level reports.
public struct ReportingCampaign: Codable, Equatable, Sendable {
    /// The channel type of ad in a campaign.
    public let adChannelType: Campaign.AdChannelType
    /// The name of the app and the `adamId`.
    public let app: CampaignAppDetail
    /// The identifier for the campaign.
    public let campaignId: Int
    /// The unique name of the campaign.
    public let campaignName: String
    /// The status of the campaign.
    public let campaignStatus: Campaign.Status
    /// The App Store geoterritories where you’re promoting your app.
    ///
    /// This field requires an ISO 3166-1 alpha-2 country code value for the locations where you’re promoting.
    /// The default value is US.
    public let countriesOrRegions: [String]
    /// The map of reasons that returns when a campaign isn’t running.
    public let countryOrRegionServingStateReasons: [Campaign.CountryOrRegionsServingStateReason]
    /// The daily budget amount available to the campaign.
    ///
    /// This is the equivalent of `dailyBudgetAmount` in your `Campaign`.
    public let dailyBudget: Money
    /// The indicator of whether the campaign is soft-deleted.
    public let deleted: Bool
    /// The status of the campaign. The status resolves according to `servingStatus` and additional criteria.
    public let displayStatus: Campaign.DisplayStatus
    /// The date and time of the most recent modification of the object.
    public let modificationTime: Date
    /// The identifier of the organization that owns the campaign.
    ///
    /// Your `orgId` is the same as your account in the Apple Search Ads UI.
    public let orgId: Int
    /// A list of reasons that displays when a campaign can’t run.
    public let servingStateReasons: [Campaign.ServingStateReason]
    /// The status of the campaign.
    public let servingStatus: Campaign.ServingStatus
    /// The ad placements for a campaign.
    public let supplySources: [SupplySource]
    /// The total campaign budget amount.
    ///
    /// This is the equivalent of `budgetAmount` in your `Campaign`.
    public let totalBudget: Money

    public init(
        adChannelType: Campaign.AdChannelType,
        app: CampaignAppDetail,
        campaignId: Int,
        campaignName: String,
        campaignStatus: Campaign.Status,
        countriesOrRegions: [String],
        countryOrRegionServingStateReasons: [Campaign.CountryOrRegionsServingStateReason],
        dailyBudget: Money,
        deleted: Bool,
        displayStatus: Campaign.DisplayStatus,
        modificationTime: Date,
        orgId: Int,
        servingStateReasons: [Campaign.ServingStateReason],
        servingStatus: Campaign.ServingStatus,
        supplySources: [SupplySource],
        totalBudget: Money
    ) {
        self.adChannelType = adChannelType
        self.app = app
        self.campaignId = campaignId
        self.campaignName = campaignName
        self.campaignStatus = campaignStatus
        self.countriesOrRegions = countriesOrRegions
        self.countryOrRegionServingStateReasons = countryOrRegionServingStateReasons
        self.dailyBudget = dailyBudget
        self.deleted = deleted
        self.displayStatus = displayStatus
        self.modificationTime = modificationTime
        self.orgId = orgId
        self.servingStateReasons = servingStateReasons
        self.servingStatus = servingStatus
        self.supplySources = supplySources
        self.totalBudget = totalBudget
    }
}
