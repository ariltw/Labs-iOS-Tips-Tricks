import Foundation
import Network

/// Check if device is connected to internet or not
/// - Returns: Boolean
static func isInternetAvailable() -> Bool {
    let monitor = NWPathMonitor()
    var status: Bool = false
    monitor.pathUpdateHandler = { path in
        if path.status == .satisfied {
            status = true
        } else {
            status = true
        }
    }

    let queue = DispatchQueue(label: "Monitor")
    monitor.start(queue: queue)
    return status
}
