public extension APIProvider {
    /// Fetches roles and organizations that the API has access to.
    ///
    /// - Returns: A list of `UserACL`.
    ///
    /// - Throws: An error of type `APIError`.
    func userACL() async throws -> Response<[UserACL]> {
        try await contextStore.userACL()
    }

    /// Fetches details of the API caller.
    ///
    /// - Returns: An object of type `MeDetail`.
    ///
    /// - Throws: An error of type `APIError`.
    func meDetail() async throws -> Response<MeDetail> {
        try await contextStore.meDetail()
    }
}
