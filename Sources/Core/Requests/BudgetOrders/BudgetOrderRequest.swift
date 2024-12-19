struct BudgetOrderRequest: RequestType {
    let path: String
    let method = HTTPMethod.get
    let task = RequestTask.plain

    init(boID: Int) throws {
        path = "/api/v5/budgetorders/\(boID)"
    }
}
