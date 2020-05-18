//
//  MockAdvertScreenPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
@testable import PhimosisStretcher

class MockAdvertScreenPresenterView: AdvertScreenPresenterView, MockObjectProtocol {
    
    var didGetBannerAdCallCount = 0
    var didGetInterstitialAdCallCount = 0
    
    func resetCallCounts() {
        self.didGetBannerAdCallCount = 0
        self.didGetInterstitialAdCallCount = 0
    }
    
    func didGetBannerAd(ad: GADBannerView?) {
        didGetBannerAdCallCount += 1
    }
    
    func didGetInterstitialAd(ad: GADInterstitial?) {
        didGetInterstitialAdCallCount += 1
    }
    
}
