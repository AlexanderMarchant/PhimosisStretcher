//
//  MockWorkoutPresenter.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockWorkoutPresenter: MockObjectProtocol, WorkoutPresenterProtocol {
    
    var beginWorkoutCallCount = 0
    var resumeWorkoutCallCount = 0
    var pauseWorkoutCallCount = 0
    var closeWorkoutCallCount = 0
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.beginWorkoutCallCount = 0
        self.resumeWorkoutCallCount = 0
        self.pauseWorkoutCallCount = 0
        self.closeWorkoutCallCount = 0
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
    }
    
    func beginWorkout() {
        beginWorkoutCallCount += 1
    }
    
    func resumeWorkout() {
        resumeWorkoutCallCount += 1
    }
    
    func pauseWorkout() {
        pauseWorkoutCallCount += 1
    }
    
    func closeWorkout() {
        closeWorkoutCallCount += 1
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
