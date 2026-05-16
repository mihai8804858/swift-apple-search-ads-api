import Foundation

/// The parent object response to a request to create a budget order.
public struct BudgetOrderUpdate: Codable, Hashable, Sendable {
    /// The response to a request to update a budget order.
    public struct Bo: Codable, Hashable, Sendable {
        /// The primary buyer’s email address.
        ///
        /// This field is updatable.
        public let primaryBuyerEmail: NullCodable<String>?
        /// The primary buyer’s name.
        ///
        /// This field is updatable.
        public let primaryBuyerName: NullCodable<String>?
        /// The billing email.
        ///
        /// This field is updatable.
        public let billingEmail: NullCodable<String>?
        /// The name of the budget order, which is unique within an organization.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let name: NullCodable<String>?
        /// The advertiser or product. This is a requirement for agency-type accounts.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let clientName: NullCodable<String>?
        /// The total budget amount available for the budget order.
        ///
        /// This field is updatable.
        public let budget: NullCodable<Money>?
        /// The scheduled start date and time for the budget order.
        ///
        /// This field is updatable only before the startDate of a campaign and is only editable
        /// if there are no campaigns assigned to the budget order.
        public let startDate: NullCodable<Date>?
        /// The scheduled end date and time for the budget order.
        ///
        /// This field is updatable.
        public let endDate: NullCodable<Date>?
        /// A purchase order number. This is a requirement for agency-type accounts.
        ///
        /// This field is updatable only before the startDate of a campaign.
        public let orderNumber: NullCodable<String>?

        public init(
            primaryBuyerEmail: NullCodable<String>? = nil,
            primaryBuyerName: NullCodable<String>? = nil,
            billingEmail: NullCodable<String>? = nil,
            name: NullCodable<String>? = nil,
            clientName: NullCodable<String>? = nil,
            budget: NullCodable<Money>? = nil,
            startDate: NullCodable<Date>? = nil,
            endDate: NullCodable<Date>? = nil,
            orderNumber: NullCodable<String>? = nil
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
