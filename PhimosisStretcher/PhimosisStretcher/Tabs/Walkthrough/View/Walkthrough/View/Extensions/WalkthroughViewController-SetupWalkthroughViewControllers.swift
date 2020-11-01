//
//  WalkthroughViewController-SetupWalkthroughViewControllers.swift
//  PTHub
//
//  Created by Alex Marchant on 20/10/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

extension WalkthroughViewController {
    
    internal func setupWalkthroughViewControllers() {
        let stretchInformationVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        stretchInformationVc.setupScreenInformation(
            imageName: "stretch-information",
            stepTitle: "Understand Phimosis",
            stepDescription: "You can find information all about the phimosis condition and the stretches you can perform to cure it.\n\nWith this information, you can better understand the condition and what you should and shouldn't do on your journey to curing it.",
            delegate: self)
        
        let performWorkoutsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        performWorkoutsVc.setupScreenInformation(
            imageName: "workout-screens",
            stepTitle: "Performing Workouts",
            stepDescription: "You can perform workouts in the app by going to the 'Workouts' tab.\n\nSimply begin the workout and follow the instructions.",
            delegate: self)
        
        let workoutSettingsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        workoutSettingsVc.setupScreenInformation(
            imageName: "workout-settings",
            stepTitle: "Custom Workout Settings",
            stepDescription: "You have complete control over the workouts you perform in the app.\n\nYou can alter the workout by updating the settings on the 'Settings' tab and clicking the save button.",
            delegate: self)
        
        let settingsRemindersVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        settingsRemindersVc.setupScreenInformation(
            imageName: "settings-reminders",
            stepTitle: "Setup Reminders",
            stepDescription: "If you want to keep yourself on track, you can add custom reminders at a specific time containing a message. These will be sent to you as notifications at the time you decide.\n\nYou can access these reminders on the 'Settings' tab, alongside other support to help you when using the app.",
            buttonText: "End Walkthrough",
            delegate: self)
        
        orderedWalkthroughSteps = [stretchInformationVc, performWorkoutsVc, workoutSettingsVc, settingsRemindersVc]
    }
    
}
