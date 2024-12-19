/// The parent object response to a request for budget order details.
public struct BudgetOrderInfo: Codable, Equatable, Sendable {
    /// The details of the budget order.
    public let bo: BudgetOrder

    public init(bo: BudgetOrder) {
        self.bo = bo
    }
}
