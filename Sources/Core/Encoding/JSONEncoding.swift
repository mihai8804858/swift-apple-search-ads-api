import Foundation

struct JSONEncoding: ParameterEncoding {
    static let `default` = JSONEncoding()

    let destination = ParameterDestination.httpBody

    func encode(request: URLRequest, with parameters: URLParameters) throws -> URLRequest {
        var encodedRequest = request
        encodedRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters.parameters)
        encodedRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return encodedRequest
    }
}
