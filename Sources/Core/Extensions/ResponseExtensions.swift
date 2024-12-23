import Foundation
import Combine

extension Response<Data> {
    func validatingStatusCode() throws -> Response<T> {
        if ResponseStatus.successRange.contains(statusCode) {
            return self
        } else {
            throw APIError(response: self)
        }
    }

    func decoding<Model: Decodable, Decoder: TopLevelDecoder>(
        _ type: Model.Type,
        decoder: Decoder
    ) throws -> Response<Model> where Decoder.Input == Data {
        do {
            let decoded = try decoder.decode(Model.self, from: model)
            return map { _ in decoded }
        } catch let error {
            throw APIError(error: error)
        }
    }
}
