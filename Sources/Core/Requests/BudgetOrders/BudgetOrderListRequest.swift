struct BudgetOrderListRequest: RequestType {
    let path = "/api/v5/budgetorders"
    let method = HTTPMethod.get
    let query: RequestQuery?

    init(pagination: Pagination?) {
        query = RequestQuery(pagination)
    }
}
