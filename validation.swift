// reference: 
// - https://medium.com/swift2go/a-better-approach-to-text-field-validations-on-ios-81bd87598070
// - https://github.com/Arrlindii

import UIKit

struct BaseError: Error {
    let message: String
    let code: String
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case email
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        }
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw BaseError(message: "Invalid e-mail Address", code: "MB")
            }
        } catch {
            throw BaseError(message: "Invalid e-mail Address", code: "MB")
        }
        return value
    }
}

extension String {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self)
    }
}

func validate() {
    var email = "marvin"
    do {
        email = try email.validatedText(validationType: ValidatorType.email)
        print("SUCCESS")
    } catch(let error) {
        print((error as! BaseError).message)
    }
}

validate()
