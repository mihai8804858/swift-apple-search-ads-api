import Foundation

extension Response<Data> {
    func validatingStatusCode() throws -> Response<T> {
        if ResponseStatus.successRange.contains(statusCode) {
            return self
        } else {
            throw APIError(response: self)
        }
    }

    func jsonDecoding<Model: Decodable>(_ type: Model.Type) throws -> Response<Model> {
        do {
            let decoded = try JSONDecoder.default.decode(Model.self, from: model)
            return map { _ in decoded }
        } catch let error {
            throw APIError(error: error)
        }
    }
}
