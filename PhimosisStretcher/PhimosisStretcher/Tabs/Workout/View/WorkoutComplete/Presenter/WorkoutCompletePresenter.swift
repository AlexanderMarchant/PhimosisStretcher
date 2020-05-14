//
//  WorkoutCompletePresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutCompletePresenterView: InformationScreenPresenterView {
    
}

protocol WorkoutCompletePresenterDelegate: InformationScreenPresenterDelegate {
}

class WorkoutCompletePresenter: InformationScreenPresenter, WorkoutCompletePresenterProtocol {
    
    let workoutCompletePresenterView: WorkoutCompletePresenterView
    let workoutCompletePresenterDelegate: WorkoutCompletePresenterDelegate
    
    init(
        with view: WorkoutCompletePresenterView,
        delegate: WorkoutCompletePresenterDelegate) {
        
        self.workoutCompletePresenterView = view
        self.workoutCompletePresenterDelegate = delegate
        
        super.init(with: view, delegate: delegate)
    }
}
