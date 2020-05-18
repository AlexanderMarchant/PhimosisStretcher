//
//  MockEnableNotificationsPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockEnableNotificationsPresenter: EnableNotificationsPresenterProtocol, MockObjectProtocol {
    
    var didTapEnableNotificationsCallCount = 0
    var didTapCloseCallCount = 0
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.didTapEnableNotificationsCallCount = 0
        self.didTapCloseCallCount = 0
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
    }
    
    func didTapEnableNotifications() {
        didTapEnableNotificationsCallCount += 1
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
    
    func reloadAds() {
        reloadAdsCallCount += 1
    }
    
    func getInterstitialAd(viewController: UIViewController) {
        getInterstitialAdCallCount += 1
    }
    
    func getBannerAd(viewController: UIViewController, bannerContainerView: UIView) {
        getBannerAdCallCount += 1
    }
    
}
