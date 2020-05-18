//
//  MockAdMobService.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
@testable import PhimosisStretcher

class MockAdMobService: AdMobServiceProtocol, MockObjectProtocol {
    
    var delegate: AdServiceDelegate
    
    var interstitial: GADInterstitial!
    
    var bannerAdRequest: GADRequest!
    
    var interstitialAdRequest: GADRequest!
    
    var bannerContainerView: UIView!
    
    required init(delegate: AdServiceDelegate) {
        self.delegate = delegate
    }
    
    
    var loadAdsCallCount = 0
    
    var displayGADInterstitialCallCount = 0
    var displayGADInterstitialReturnValue: GADInterstitial?
    
    var setupAdBannerViewCallCount = 0
    var setupAdBannerViewReturnValue: GADBannerView?
    
    func resetCallCounts() {
        self.displayGADInterstitialCallCount = 0
        self.loadAdsCallCount = 0
        self.setupAdBannerViewCallCount = 0
    }
    
    func displayGADInterstitial() -> GADInterstitial? {
        displayGADInterstitialCallCount += 1
        return displayGADInterstitialReturnValue
    }
    
    func loadAds() {
        loadAdsCallCount += 1
    }
    
    func setupAdBannerView(_ adUnitId: String, _ viewController: UIViewController, _ bannerContainerView: UIView) -> GADBannerView {
        setupAdBannerViewCallCount += 1
        return setupAdBannerViewReturnValue!
    }
    
    
}
