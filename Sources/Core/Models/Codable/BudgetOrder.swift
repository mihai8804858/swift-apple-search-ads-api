import Foundation

/// The response to requests for budget order details.
public struct BudgetOrder: Codable, Equatable, Sendable {
    /// The system-controlled status indicator for the budget order.
    public enum Status: String, Codable, Equatable, Sendable {
        /// This status occurs when the budget order reaches its start date.
        case active = "ACTIVE"
        /// This status occurs after you create the budget order and before it reaches its start date.
        case inactive = "INACTIVE"
        /// This status occurs when you cancel the budget order.
        case cancelled = "CANCELED"
        /// This status occurs when the budget order reaches its end date.
        case completed = "COMPLETED"
        /// This status occurs when you exhaust the budget for the budget order before it reaches its end date.
        case exhausted = "EXHAUSTED"
    }

    /// A unique identifier for the budget order.
    public let id: Int
    /// The unique identifier of the organization that owns the budget order.
    public let parentOrgId: Int
    /// The primary buyer’s email address.
    ///
    /// This field is updatable.
    public let primaryBuyerEmail: String
    /// The primary buyer’s name.
    ///
    /// This field is updatable.
    public let primaryBuyerName: String
    /// The billing email.
    ///
    /// This field is updatable.
    public let billingEmail: String
    /// The name of the budget order, which is unique within an organization.
    ///
    /// This field is updatable only before the startDate of a campaign.
    public let name: String
    /// The advertiser or product. This is a requirement for agency-type accounts.
    ///
    /// This field is updatable only before the startDate of a campaign.
    public let clientName: String
    /// The total budget amount available for the budget order.
    ///
    /// This field is updatable.
    public let budget: Money
    /// The scheduled start date and time for the budget order.
    ///
    /// This field is updatable only before the startDate of a campaign and is only editable
    /// if there are no campaigns assigned to the budget order.
    public let startDate: Date
    /// The scheduled end date and time for the budget order.
    ///
    /// This field is updatable.
    public let endDate: Date
    /// A purchase order number. This is a requirement for agency-type accounts.
    ///
    /// This field is updatable only before the startDate of a campaign.
    public let orderNumber: String
    /// The supply source of ads to use in a budget order and a campaign.
    public let supplySources: [SupplySource]
    /// The system-controlled status indicator for the budget order.
    public let status: Status

    public init(
        id: Int,
        parentOrgId: Int,
        primaryBuyerEmail: String,
        primaryBuyerName: String,
        billingEmail: String,
        name: String,
        clientName: String,
        budget: Money,
        startDate: Date,
        endDate: Date,
        orderNumber: String,
        supplySources: [SupplySource],
        status: Status
    ) {
        self.id = id
        self.parentOrgId = parentOrgId
        self.primaryBuyerEmail = primaryBuyerEmail
        self.primaryBuyerName = primaryBuyerName
        self.billingEmail = billingEmail
        self.name = name
        self.clientName = clientName
        self.budget = budget
        self.startDate = startDate
        self.endDate = endDate
        self.orderNumber = orderNumber
        self.supplySources = supplySources
        self.status = status
    }
}
