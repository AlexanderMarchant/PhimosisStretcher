//
//  RequestReview.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import StoreKit

struct RequestReview {
    
    static func requestReview() {
        let minimumLaunchCount = 5
        let launchCount = UserDefaults.standard.integer(forKey: Constants.appLaunchCount)
        
        if launchCount >= minimumLaunchCount {
            UserDefaults.standard.set((0), forKey: Constants.appLaunchCount)
            SKStoreReviewController.requestReview()
        } else {
            UserDefaults.standard.set((launchCount + 1), forKey: Constants.appLaunchCount)
        }
    }

}

