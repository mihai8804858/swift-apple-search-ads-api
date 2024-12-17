struct UserACLRequest: RequestType {
    let path = "/api/v5/acls"
    let method = HTTPMethod.get
    let task = RequestTask.plain
}
