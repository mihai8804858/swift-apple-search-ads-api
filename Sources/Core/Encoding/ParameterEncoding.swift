import Foundation

protocol ParameterEncoding: Sendable {
    var destination: ParameterDestination { get }
    func encode(request: URLRequest, with parameters: URLParameters) throws -> URLRequest
}
