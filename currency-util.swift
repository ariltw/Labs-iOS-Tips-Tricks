import Foundation

/// Unfinished task
class CurrencyUtil {
    private var currency = String()
    private var locale = Locale(identifier: "id-ID")
    private var formatter = NumberFormatter()
    
    init() {
        
    }
    
    init(for double: Double) {
        currency = String(double)
    }
    
    init(for string: String) {
        currency = string
    }
    
    // MARK: - SETUP FRACTION SEPARATOR
    
    func addFractionSeparator() -> CurrencyUtil {
        return self
    }
    
    func removeFractionSeparator() -> CurrencyUtil {
        currency = String(currency.prefix(currency.count-3))
        return self
    }
    
    // MARK: - SETUP GROUPING SEPARATOR
    
    func addGroupingSeparator(separator: String = ".") -> CurrencyUtil {
        formatter.decimalSeparator = separator
        formatter.usesGroupingSeparator = true
        return self
    }
    
    func removeGroupingSeparator(separator: String = ".") -> CurrencyUtil {
        formatter.decimalSeparator = separator
        formatter.usesGroupingSeparator = false
        return self
    }
    
    // MARK: - SETUP SYMBOL
    
    func addSymbol(_ locale: Locale = Locale(identifier: "id-ID")) -> CurrencyUtil {
        formatter.locale = locale
        return self
    }
    
    func removeSymbol() -> CurrencyUtil {
        return self
    }
    
    // MARK: - BUILD
    
    func build() -> String {
        guard let amount = formatter.number(from: currency), let newAmount = formatter.string(from: amount) else {
                return "-"
        }
        return newAmount
    }
}
