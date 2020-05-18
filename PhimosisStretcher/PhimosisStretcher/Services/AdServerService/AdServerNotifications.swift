//
//  AdServerNotifications.swift
//  Phimosis Stretcher
//
//  Created by Alex Marchant on 25/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let didFailToLoadAdMobBanner = Notification.Name("didFailToLoadAdMobBanner")
    static let didFailToLoadAdMobInterstitial = Notification.Name("didFailToLoadAdMobInterstitial")
}

extension Notification {
    static func didFailToLoadAdMobBanner() -> Notification {
        return Notification(name: Notification.Name.didFailToLoadAdMobBanner)
    }
    static func didFailToLoadAdMobInterstitial() -> Notification {
        return Notification(name: Notification.Name.didFailToLoadAdMobInterstitial)
    }
}
