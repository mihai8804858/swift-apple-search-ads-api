/// The parent object response to a request for budget order details.
public struct BudgetOrderInfo: Decodable, Equatable, Sendable {
    /// The details of the budget order.
    public let bo: BudgetOrder

    /// Create an instance of `BudgetOrderInfo`.
    ///
    /// - Parameters:
    ///     - bo: The details of the budget order.
    public init(bo: BudgetOrder) {
        self.bo = bo
    }
}
