//
//  MockSettingsPresenter.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockSettingsPresenter: MockObjectProtocol, SettingsPresenterProtocol {
    
    var getWorkoutSettingsCallCount = 0
    var saveChangesCallCount = 0
    var sendEmailCallCount = 0
    var getCueSettingsCallCount = 0
    var updateVibrateCueCallCount = 0
    var updateVisualCueCallCount = 0
    var updateAudioCueCallCount = 0
    var didSelectRemindersCallCount = 0
    var getNotificationSettingsCallCount = 0
    var didSelectCreditsCallCount = 0
    var showWalkthroughCallCount = 0
    
    var reloadAdsCallCount = 0
    var getInterstitialAdCallCount = 0
    var getBannerAdCallCount = 0
    
    func resetCallCounts() {
        self.getWorkoutSettingsCallCount = 0
        self.saveChangesCallCount = 0
        self.sendEmailCallCount = 0
        self.getCueSettingsCallCount = 0
        self.updateVibrateCueCallCount = 0
        self.updateVisualCueCallCount = 0
        self.updateAudioCueCallCount = 0
        self.didSelectRemindersCallCount = 0
        self.getNotificationSettingsCallCount = 0
        self.didSelectCreditsCallCount = 0
        self.showWalkthroughCallCount = 0
        
        self.reloadAdsCallCount = 0
        self.getInterstitialAdCallCount = 0
        self.getBannerAdCallCount = 0
    }
    
    func getWorkoutSettings() {
        getWorkoutSettingsCallCount += 1
    }
    
    func saveChanges(targetWorkoutsPerDay: String?, repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?) {
        saveChangesCallCount += 1
    }
    
    func sendEmail() {
        sendEmailCallCount += 1
    }
    
    func getCueSettings() {
        getCueSettingsCallCount += 1
    }
    
    func updateVibrateCue() {
        updateVibrateCueCallCount += 1
    }
    
    func updateVisualCue() {
        updateVisualCueCallCount += 1
    }
    
    func updateAudioCue() {
        updateAudioCueCallCount += 1
    }
    
    func didSelectReminders() {
        didSelectRemindersCallCount += 1
    }
    
    func getNotificationSettings() {
        getNotificationSettingsCallCount += 1
    }
    
    func didSelectCredits() {
        didSelectCreditsCallCount += 1
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
    
    func showWalkthrough() {
        showWalkthroughCallCount += 1
    }
}
