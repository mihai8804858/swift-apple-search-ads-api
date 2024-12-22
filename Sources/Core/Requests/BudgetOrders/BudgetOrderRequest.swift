struct BudgetOrderRequest: RequestType {
    let path: String
    let method = HTTPMethod.get

    init(boID: Int) {
        path = "/api/v5/budgetorders/\(boID)"
    }
}
