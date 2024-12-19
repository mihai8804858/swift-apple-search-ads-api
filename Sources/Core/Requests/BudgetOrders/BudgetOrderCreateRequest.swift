struct BudgetOrderCreateRequest: RequestType {
    let path = "/api/v5/budgetorders"
    let method = HTTPMethod.post
    let task: RequestTask

    init(budgetOrder: BudgetOrderCreate) throws {
        task = .parameterized(EncodedParameters(
            encoding: JSONEncoding.default,
            parameters: try URLParameters(encoding: budgetOrder)
        ))
    }
}
