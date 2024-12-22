struct BudgetOrderUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let body: RequestBody?

    init(boID: Int, budgetOrder: BudgetOrderUpdate) {
        path = "/api/v5/budgetorders/\(boID)"
        body = .json(budgetOrder)
    }
}
