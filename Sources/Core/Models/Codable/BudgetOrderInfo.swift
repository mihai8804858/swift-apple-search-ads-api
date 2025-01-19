/// The parent object response to a request for budget order details.
public struct BudgetOrderInfo: Codable, Hashable, Sendable {
    /// The details of the budget order.
    public let bo: BudgetOrder?

    public init(bo: BudgetOrder? = nil) {
        self.bo = bo
    }
}
