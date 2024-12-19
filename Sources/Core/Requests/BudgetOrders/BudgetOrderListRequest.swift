struct BudgetOrderListRequest: RequestType {
    let path = "/api/v5/budgetorders"
    let method = HTTPMethod.get
    let task: RequestTask

    init(pagination: Pagination? = nil) throws {
        task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "limit": pagination?.limit,
                "offset": pagination?.offset
            ])
        ))
    }
}
