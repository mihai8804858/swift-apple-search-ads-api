struct BudgetOrderCreateRequest: RequestType {
    let path = "/api/v5/budgetorders"
    let method = HTTPMethod.post
    let body: RequestBody?

    init(budgetOrder: BudgetOrderCreate) {
        body = .json(budgetOrder)
    }
}
