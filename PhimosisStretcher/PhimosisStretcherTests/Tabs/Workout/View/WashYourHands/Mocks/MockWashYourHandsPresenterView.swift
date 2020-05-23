//
//  MockWashYourHandsPresenterView.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
@testable import PhimosisStretcher

class MockWashYourHandsPresenterView: WashYourHandsPresenterView, MockObjectProtocol {
    
    var errorOccurredCallCount = 0
    var didGetBannerAdCallCount = 0
    var didGetInterstitialAdCallCount = 0
    
    func resetCallCounts() {
        self.errorOccurredCallCount = 0
        self.didGetBannerAdCallCount = 0
        self.didGetInterstitialAdCallCount = 0
    }
    
    func errorOccurred(message: String) {
        errorOccurredCallCount += 1
    }
    
    func didGetBannerAd(ad: GADBannerView?) {
        didGetBannerAdCallCount += 1
    }
    
    func didGetInterstitialAd(ad: GADInterstitial?) {
        didGetInterstitialAdCallCount += 1
    }
    
}
