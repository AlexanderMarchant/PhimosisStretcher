//
//  MockWorkoutCompletePresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockWorkoutCompletePresenter: WorkoutCompletePresenterProtocol, MockObjectProtocol {
    
    var didTapCloseCallCount = 0
    var updateWorkoutsTodayCallCount = 0
    var displayInterstitialAdCallCount = 0
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.didTapCloseCallCount = 0
        self.updateWorkoutsTodayCallCount = 0
        self.displayInterstitialAdCallCount = 0

        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
    
    func updateWorkoutsToday() {
        updateWorkoutsTodayCallCount += 1
    }
    
    func displayInterstitialAd(viewController: UIViewController) {
        displayInterstitialAdCallCount += 1
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
