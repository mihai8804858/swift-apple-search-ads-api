import Foundation

/// The parent object response to a request to create a budget order.
public struct BudgetOrderCreate: Codable, Equatable, Sendable {
    /// The response to a request to create a budget order.
    public struct Bo: Codable, Equatable, Sendable {
        /// The primary buyer’s email address.
        public let primaryBuyerEmail: String
        /// The primary buyer’s name.
        public let primaryBuyerName: String
        /// The billing email.
        public let billingEmail: String
        /// The name of the budget order, which is unique within an organization.
        public let name: String
        /// The advertiser or product. This is a requirement for agency-type accounts.
        public let clientName: String
        /// The total budget amount available for the budget order.
        public let budget: Money
        /// The scheduled start date and time for the budget order.
        public let startDate: Date
        /// The scheduled end date and time for the budget order.
        public let endDate: Date
        /// A purchase order number. This is a requirement for agency-type accounts.
        public let orderNumber: String
        /// The supply source of ads to use in a budget order and a campaign.
        public let supplySources: [SupplySource]

        public init(
            primaryBuyerEmail: String,
            primaryBuyerName: String,
            billingEmail: String,
            name: String,
            clientName: String,
            budget: Money,
            startDate: Date,
            endDate: Date,
            orderNumber: String,
            supplySources: [SupplySource]
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

    /// Contains the details of the budget order.
    public let bo: Bo
    /// The identifier of the organization that owns the campaign. Currently, only one orgId is supported.
    public let orgIds: [Int]

    public init(bo: Bo, orgIds: [Int]) {
        self.bo = bo
        self.orgIds = orgIds
    }
}
