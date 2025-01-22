import Foundation

/// The list of campaign fields that are updatable.
public struct CampaignUpdateProperties: Codable, Hashable, Sendable {
    /// The name of the campaign, which is unique within an organization.
    ///
    /// This field is updatable.
    /// Maximum Length: 200.
    public let name: String?
    /// The user-controlled status to enable or pause the campaign.
    ///
    /// This field is updatable.
    public let status: Campaign.Status?
    /// The lifetime budget amount available to a campaign.
    ///
    /// Campaigns require a `dailyBudgetAmount` or a `budgetAmount`, or both.
    /// If you update a `budgetAmount`, the updated amount must be greater than the previous
    /// `budgetAmount` and must exceed the lifetime spend of the campaign.
    public let budgetAmount: Money?
    /// The budget orders that you assign to the campaign.
    ///
    /// This applies only to campaigns with a line-of-credit payment model.
    /// This field is updatable.
    public let budgetOrders: [Int]?
    /// Your daily budget.
    ///
    /// - Campaigns require a `dailyBudgetAmount` or a `budgetAmount`, or both.
    /// - Your `dailyBudgetAmount` must be less than your `budgetAmount`.
    /// - Your `dailyBudgetAmount` must be greater than or equal to the `defaultBidAmount` in your ad group.
    ///
    /// This field is updatable.
    public let dailyBudgetAmount: Money?
    /// The App Store geoterritories where you’re promoting your app. The default value is US.
    ///
    /// This field requires an ISO country code value for the locations where you’re promoting.
    public let countriesOrRegions: [String]?
    /// The standard invoice details you can set and edit using the `LOCInvoiceDetails` object.
    public let locInvoiceDetails: LOCInvoiceDetails?
    /// The scheduled start date and time for the campaign.
    ///
    /// - The startTime must be greater than the current time, and before the campaign endTime, if you set it.
    /// - If you don’t set a startTime, the campaign defaults to the campaign request timestamp and the startTime
    /// is updatable until you reach the designated time.
    /// - The startTime must be in UTC.
    public let startTime: Date?
    /// The scheduled end time and date for the campaign.
    ///
    /// - The endTime must be after the startTime.
    /// - The endTime is updatable until you reach the designated time.
    /// - The endTime must be in UTC.
    public let endTime: Date?

    public init(
        name: String? = nil,
        status: Campaign.Status? = nil,
        budgetAmount: Money? = nil,
        budgetOrders: [Int]? = nil,
        dailyBudgetAmount: Money? = nil,
        countriesOrRegions: [String]? = nil,
        locInvoiceDetails: LOCInvoiceDetails? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil
    ) {
        self.name = name
        self.status = status
        self.budgetAmount = budgetAmount
        self.budgetOrders = budgetOrders
        self.dailyBudgetAmount = dailyBudgetAmount
        self.countriesOrRegions = countriesOrRegions
        self.locInvoiceDetails = locInvoiceDetails
        self.startTime = startTime
        self.endTime = endTime
    }
}
