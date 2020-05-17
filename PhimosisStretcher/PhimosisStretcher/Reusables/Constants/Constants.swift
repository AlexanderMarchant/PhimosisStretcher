//
//  Constants.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 13/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

struct Constants {
    //  User Preference Keys
    static let targetWorkoutsPerDay = "TargetWorkoutsPerDay"
    static let repsPerWorkout = "RepsPerWorkout"
    static let repLength = "RepLength"
    static let restLength = "RestLength"
    static let prepareLength = "PrepareLength"
    static let workoutsToday = "WorkoutsToday"
    static let totalWorkoutTime = "TotalWorkoutTime"
    static let todaysDate = "TodaysDate"
    static let useVibrateCues = "UseVibrateCues"
    static let useVisualCues = "UseVisualCues"
    static let useAudioCues = "UseSoundCues"
    static let adsDisabled = "AdsDisabled"
    
    //  User Default Keys
    static let appLaunchCount = "AppLaunchCount"
    static let launchedBefore = "LaunchedBefore"
    
    //  Dispatch Queue
    static let dispatchQueueLabel = "ResumeWorkout"
    
    // Reusable Cells
    static let remindersCellIndexPath = IndexPath(row: 0, section: 2)
    
    static let emailCellIndexPath = IndexPath(row: 0, section: 3)
    
    static let kegelTrainerCell = "KegelTrainerCell"
    static let kegelTrainerCellIndexPath = IndexPath(row: 0, section: 4)
    
    static let creditsIndexPath = IndexPath(row: 0, section: 5)
    
    static let reminderCell = "Reminder"
    
    // AdMob Test Ad Id's
    static let testBannerAdId = "ca-app-pub-3940256099942544/2934735716"
    static let testInterstitialAdId = "ca-app-pub-3940256099942544/4411468910"
    
    //  AdMob Ad Unit Id's
    static let generalBannerAdId = "ca-app-pub-4293952743610750/5028075875"
    static let workoutCompleteInterstitialAdId = "ca-app-pub-4293952743610750/2258921237"
    
    static let email = "phimosisstretcher@gmail.com"
}
