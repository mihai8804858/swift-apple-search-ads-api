import Foundation

/// The parent object response to a request to create a budget order.
public struct BudgetOrderUpdate: Codable, Hashable, Sendable {
    /// The response to a request to update a budget order.
    public struct Bo: Codable, Hashable, Sendable {
        /// The primary buyer’s email address.
        ///
        /// This field is updatable.
        public let primaryBuyerEmail: String?
        /// The primary buyer’s name.
        ///
        /// This field is updatable.
        public let primaryBuyerName: String?
        /// The billing email.
        ///
        /// This field is updatable.
        public let billingEmail: String?
        /// The name of the budget order, which is unique within an organization.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let name: String?
        /// The advertiser or product. This is a requirement for agency-type accounts.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let clientName: String?
        /// The total budget amount available for the budget order.
        ///
        /// This field is updatable.
        public let budget: Money?
        /// The scheduled start date and time for the budget order.
        ///
        /// This field is updatable only before the startDate of a campaign and is only editable
        /// if there are no campaigns assigned to the budget order.
        public let startDate: Date?
        /// The scheduled end date and time for the budget order.
        ///
        /// This field is updatable.
        public let endDate: Date?
        /// A purchase order number. This is a requirement for agency-type accounts.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let orderNumber: String?

        public init(
            primaryBuyerEmail: String? = nil,
            primaryBuyerName: String? = nil,
            billingEmail: String? = nil,
            name: String? = nil,
            clientName: String? = nil,
            budget: Money? = nil,
            startDate: Date? = nil,
            endDate: Date? = nil,
            orderNumber: String? = nil
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
        }
    }

    /// The identifier of the organization that owns the campaign.
    /// Currently, only one orgId is supported in budget orders.
    public let orgIds: [Int]
    /// The details of the budget order.
    public let bo: Bo

    public init(orgIds: [Int], bo: Bo) {
        self.orgIds = orgIds
        self.bo = bo
    }
}
