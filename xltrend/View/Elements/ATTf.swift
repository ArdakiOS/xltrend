//
//  ATTf.swift
//  xltrend
//
//  Created by Ardak Tursunbayev on 15.04.2024.
//

import Foundation
import UIKit
import AppTrackingTransparency
final class ATTObserver {
    
    func requestTrackingAuthorization(completion: @escaping (() -> ())) {
        removeObserver()
        
        ATTrackingManager.requestTrackingAuthorization { [weak self] status in
            switch status {
            case .denied:
                if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
                    debugPrint("iOS 17.4 authorixation bug detected")
                    self?.addObserver(completion: completion)
                    return
                }
            default:
                completion()
            }
            debugPrint("status = \(status)")
        }
    }
    private weak var observer: NSObjectProtocol?
    private func addObserver(completion: @escaping (() -> ())) {
        removeObserver()
        observer = NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification,
            object: nil,
            queue: .main,
            using: {[weak self] _ in
                self?.requestTrackingAuthorization(completion: completion)
                completion()
            })
    }
    private func removeObserver() {
        if let observer {
            NotificationCenter.default.removeObserver(observer)
        }
        observer = nil
    }
}
