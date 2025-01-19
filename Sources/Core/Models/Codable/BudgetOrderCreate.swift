import Foundation

/// The parent object response to a request to create a budget order.
public struct BudgetOrderCreate: Codable, Hashable, Sendable {
    /// The response to a request to create a budget order.
    public struct Bo: Codable, Hashable, Sendable {
        /// The primary buyer’s email address.
        public let primaryBuyerEmail: String?
        /// The primary buyer’s name.
        public let primaryBuyerName: String?
        /// The billing email.
        public let billingEmail: String?
        /// The name of the budget order, which is unique within an organization.
        public let name: String?
        /// The advertiser or product. This is a requirement for agency-type accounts.
        public let clientName: String?
        /// The total budget amount available for the budget order.
        public let budget: Money?
        /// The scheduled start date and time for the budget order.
        public let startDate: Date?
        /// The scheduled end date and time for the budget order.
        public let endDate: Date?
        /// A purchase order number. This is a requirement for agency-type accounts.
        public let orderNumber: String?
        /// The supply source of ads to use in a budget order and a campaign.
        public let supplySources: [SupplySource]?

        public init(
            primaryBuyerEmail: String? = nil,
            primaryBuyerName: String? = nil,
            billingEmail: String? = nil,
            name: String? = nil,
            clientName: String? = nil,
            budget: Money? = nil,
            startDate: Date? = nil,
            endDate: Date? = nil,
            orderNumber: String? = nil,
            supplySources: [SupplySource]? = nil
        ) {
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
        }
    }

    /// The identifier of the organization that owns the campaign. Currently, only one orgId is supported.
    public let orgIds: [Int]
    /// Contains the details of the budget order.
    public let bo: Bo

    public init(orgIds: [Int], bo: Bo) {
        self.orgIds = orgIds
        self.bo = bo
    }
}
