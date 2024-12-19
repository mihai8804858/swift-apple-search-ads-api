import Foundation

/// The parent object response to a request to create a budget order.
public struct BudgetOrderUpdate: Encodable, Equatable, Sendable {
    /// The response to a request to update a budget order.
    public struct Bo: Encodable, Equatable, Sendable {
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

        /// Create an instance of `Bo`.
        ///
        /// - Parameters:
        ///     - primaryBuyerEmail: The primary buyer’s email address.
        ///     - primaryBuyerName: The primary buyer’s name.
        ///     - billingEmail: The billing email.
        ///     - name: The name of the budget order, which is unique within an organization.
        ///     - clientName: The advertiser or product. This is a requirement for agency-type accounts.
        ///     - budget: The total budget amount available for the budget order.
        ///     - startDate: The scheduled start date and time for the budget order.
        ///     - endDate: The scheduled end date and time for the budget order.
        ///     - orderNumber: A purchase order number. This is a requirement for agency-type accounts.
        public init(
            primaryBuyerEmail: String,
            primaryBuyerName: String,
            billingEmail: String,
            name: String,
            clientName: String,
            budget: Money,
            startDate: Date,
            endDate: Date,
            orderNumber: String
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

    /// The details of the budget order.
    public let bo: Bo
    /// The identifier of the organization that owns the campaign.
    /// Currently, only one orgId is supported in budget orders.
    public let orgIds: [Int]

    /// Create an instance of `BudgetOrderUpdate`.
    ///
    /// - Parameters:
    ///     - bo: The details of the budget order.
    ///     - orgIds: The identifier of the organization that owns the campaign.
    ///     Currently, only one orgId is supported in budget orders.
    public init(bo: Bo, orgIds: [Int]) {
        self.bo = bo
        self.orgIds = orgIds
    }
}
