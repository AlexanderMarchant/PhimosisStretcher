//
//  MockStretchesPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockStretchesPresenter: MockObjectProtocol, StretchesPresenterProtocol {
    
    var didSelectStretchCallCount = 0
    var didSelectUnderstandingPhimosisCallCount = 0
    var didSelectSafetyMeasuresCallCount = 0
    
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    var reloadAdsCallCount = 0
    
    func resetCallCounts() {
        self.didSelectStretchCallCount = 0
        self.didSelectUnderstandingPhimosisCallCount = 0
        self.didSelectSafetyMeasuresCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
        self.reloadAdsCallCount = 0
    }
    
    func didSelectStretch(_ selectedStretch: StretchInfo) {
        didSelectStretchCallCount += 1
    }
    
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis) {
        didSelectUnderstandingPhimosisCallCount += 1
    }
    
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        didSelectSafetyMeasuresCallCount += 1
    }
    
    func getInterstitialAd(viewController: UIViewController) {
        getInterstitialAdCallCount += 1
    }
    
    func getBannerAd(viewController: UIViewController, bannerContainerView: UIView) {
        getBannerAdCallCount += 1
    }
    
    func reloadAds() {
        reloadAdsCallCount += 1
    }
}
