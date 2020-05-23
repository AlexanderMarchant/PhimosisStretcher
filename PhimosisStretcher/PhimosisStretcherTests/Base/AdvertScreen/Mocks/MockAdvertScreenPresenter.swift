//
//  MockAdvertScreenPresenter.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockAdvertScreenPresenter: AdvertScreenPresenterProtocol, MockObjectProtocol {
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
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
