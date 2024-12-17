import Foundation

extension URLQueryItem {
    var urlQueryEncoded: URLQueryItem {
        var item = self
        item.value = value?.urlQueryEncoded

        return item
    }
}
