//
//  WorkoutPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutPresenterView {
}

protocol WorkoutPresenterDelegate {
}

class WorkoutPresenter: WorkoutPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: WorkoutPresenterView
    let delegate: WorkoutPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: WorkoutPresenterView,
        delegate: WorkoutPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
}
