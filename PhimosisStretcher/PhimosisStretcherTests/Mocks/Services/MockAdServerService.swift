//
//  MockAdServerService.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
@testable import PhimosisStretcher

class MockAdServerService: AdServerServiceProtocol, MockObjectProtocol {
    
    var reloadAdsCallCount = 0
    
    var getInterstitialAdCallCount = 0
    var getInterstitialAdReturnValue: GADInterstitial?
    
    var setupAdMobBannerViewCallCount = 0
    var setupAdMobBannerViewReturnValue: GADBannerView?
    
    
    func resetCallCounts() {
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.setupAdMobBannerViewCallCount = 0
    }
    
    var adsAreDisabled: Bool!
    
    var adMobService: AdMobService!
    
    func reloadAds() {
        reloadAdsCallCount += 1
    }
    
    func getInterstitialAd() -> GADInterstitial? {
        getInterstitialAdCallCount += 1
        return getInterstitialAdReturnValue
    }
    
    func setupAdMobBannerView(adId: String, viewController: UIViewController, bannerContainerView: UIView) -> GADBannerView? {
        setupAdMobBannerViewCallCount += 1
        return setupAdMobBannerViewReturnValue
    }
    
    
}
