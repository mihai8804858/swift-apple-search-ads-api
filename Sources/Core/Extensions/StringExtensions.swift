import Foundation

@resultBuilder
enum StringBuilder {
    static func buildExpression(_ expression: String) -> String {
        expression
    }

    static func buildExpression(_ expression: String?) -> String {
        expression ?? ""
    }

    static func buildBlock(_ children: String...) -> String {
        children.joined()
    }

    static func buildArray(_ children: [String]) -> String {
        children.joined()
    }

    static func buildOptional(_ children: String?) -> String {
        children ?? ""
    }

    static func buildBlock(_ component: String) -> String {
        component
    }

    static func buildEither(first child: String) -> String {
        child
    }

    static func buildEither(second child: String) -> String {
        child
    }
}

extension String {
    static func build(@StringBuilder builder: () -> String) -> String {
        builder()
    }
}

extension String {
    var urlQueryEncoded: String {
        let allowedCharacterSet: CharacterSet = {
            let delimitersToEncode = ":#[]@!$&'()*+,;=" // does not include "?" or "/" due to RFC 3986 - Section 3.4
            var allowedCharacterSet = CharacterSet.urlQueryAllowed
            allowedCharacterSet.remove(charactersIn: delimitersToEncode)
            return allowedCharacterSet
        }()

        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
    }
}
