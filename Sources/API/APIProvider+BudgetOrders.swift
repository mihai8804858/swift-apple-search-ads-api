public extension APIProvider {
    /// Creates a budget order in the context of your org ID.
    ///
    /// - Parameters:
    ///     - budgetOrder: Details of the budget order.
    ///
    /// - Returns: A object of type `BudgetOrderInfo`.
    ///
    /// - Throws: An error of type `APIError`
    func createBudgetOrder(budgetOrder: BudgetOrderCreate) async throws -> Response<BudgetOrderInfo> {
        try await provider.requestDataModel(from: BudgetOrderCreateRequest(budgetOrder: budgetOrder))
    }

    /// Updates an existing budget order.
    ///
    /// - Parameters:
    ///     - boID: The unique identifier for the budget order.
    ///     - budgetOrder: Details of the budget order.
    ///
    /// - Returns: A object of type `BudgetOrderInfo`.
    ///
    /// - Throws: An error of type `APIError`
    func updateBudgetOrder(boID: Int, budgetOrder: BudgetOrderUpdate) async throws -> Response<BudgetOrderInfo> {
        try await provider.requestDataModel(from: BudgetOrderUpdateRequest(boID: boID, budgetOrder: budgetOrder))
    }

    /// Fetches a specific budget order using a budget order identifier.
    ///
    /// - Parameters:
    ///     - boID: The unique identifier for the budget order.
    ///
    /// - Returns: A object of type `BudgetOrderInfo`.
    ///
    /// - Throws: An error of type `APIError`
    func getBudgetOrder(boID: Int) async throws -> Response<BudgetOrderInfo> {
        try await provider.requestDataModel(from: BudgetOrderRequest(boID: boID))
    }

    /// Fetches all assigned budget orders for an organization.
    ///
    /// - Parameters:
    ///     - pagination: The offset and limit pagination that limits the number of records returned.
    ///
    /// - Returns: A paginated list of `BudgetOrderInfo`.
    ///
    /// - Throws: An error of type `APIError`
    func listBudgetOrders(pagination: Pagination? = nil) async throws -> Response<Paginated<BudgetOrderInfo>> {
        try await provider.requestPaginatedModel(from: BudgetOrderListRequest(pagination: pagination))
    }
}
