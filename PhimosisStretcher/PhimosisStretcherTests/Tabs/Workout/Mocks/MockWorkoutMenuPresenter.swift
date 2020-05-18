//
//  MockWorkoutMenuPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockWorkoutMenuPresenter: MockObjectProtocol, WorkoutMenuPresenterProtocol {
    
    var getWorkoutInformationCallCount = 0
    var startWorkoutCallCount = 0
    var displayInterstitialAdCallCount = 0
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.getWorkoutInformationCallCount = 0
        self.startWorkoutCallCount = 0
        self.displayInterstitialAdCallCount = 0
        
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
    }
    
    func getWorkoutInformation() {
        getWorkoutInformationCallCount += 1
    }
    
    func startWorkout() {
        startWorkoutCallCount += 1
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
