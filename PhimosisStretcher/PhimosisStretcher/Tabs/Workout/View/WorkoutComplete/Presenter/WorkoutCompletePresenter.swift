//
//  WorkoutCompletePresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol WorkoutCompletePresenterView: InformationScreenPresenterView {
    
}

protocol WorkoutCompletePresenterDelegate: InformationScreenPresenterDelegate {
}

class WorkoutCompletePresenter: InformationScreenPresenter, WorkoutCompletePresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol!
    let workoutCompletePresenterView: WorkoutCompletePresenterView
    let workoutCompletePresenterDelegate: WorkoutCompletePresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: WorkoutCompletePresenterView,
        delegate: WorkoutCompletePresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.workoutCompletePresenterView = view
        self.workoutCompletePresenterDelegate = delegate
        
        super.init(adServerService, with: view, delegate: delegate)
    }
    
    func displayInterstitialAd(viewController: UIViewController) {
        super.getInterstitialAd(viewController: viewController)
    }
    
    func updateWorkoutsToday() {
        let workoutsToday = userDefaultsService.integer(forKey: Constants.workoutsToday)
        userDefaultsService.set(workoutsToday + 1, forKey: Constants.workoutsToday)
    }
}
