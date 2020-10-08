import Foundation
import SystemConfiguration
    
private func hasConnection (to url: String) -> Bool {
    let reachability = SCNetworkReachabilityCreateWithName(nil, url)

    var flags = SCNetworkReachabilityFlags()
    SCNetworkReachabilityGetFlags(reachability!, &flags)

    func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }

    return isNetworkReachable(with: flags)
}
