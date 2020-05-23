//
//  MockSettingsPresenterView.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
@testable import PhimosisStretcher

class MockSettingsPresenterView: MockObjectProtocol, SettingsPresenterView {
    
    var didGetWorkoutSettingsCallCount = 0
    var didGetCueSettingsCallCount = 0
    var savedChangesCallCount = 0
    var errorOccurredCallCount = 0
    var didGetBannerAdCallCount = 0
    var didGetInterstitialAdCallCount = 0
    
    func resetCallCounts() {
        self.didGetWorkoutSettingsCallCount = 0
        self.didGetCueSettingsCallCount = 0
        self.savedChangesCallCount = 0
        self.errorOccurredCallCount = 0
        self.didGetBannerAdCallCount = 0
        self.didGetInterstitialAdCallCount = 0
    }
    
    func didGetWorkoutSettings(_ targetWorkoutsPerDay: String, _ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String) {
        didGetWorkoutSettingsCallCount += 1
    }
    
    func didGetCueSettings(_ useVibrateCues: Bool, _ useVisualCues: Bool, _ useAudioCues: Bool) {
        didGetCueSettingsCallCount += 1
    }
    
    func savedChanges() {
        savedChangesCallCount += 1
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
