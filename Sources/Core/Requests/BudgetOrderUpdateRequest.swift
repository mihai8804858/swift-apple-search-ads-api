struct BudgetOrderUpdateRequest: RequestType {
    let path: String
    let method = HTTPMethod.put
    let task: RequestTask

    init(boID: Int, budgetOrder: BudgetOrderUpdate) throws {
        path = "/api/v5/budgetorders/\(boID)"
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: budgetOrder)
        ))
    }
}
