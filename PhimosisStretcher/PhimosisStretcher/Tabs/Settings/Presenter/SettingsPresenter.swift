//
//  SettingsPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol SettingsPresenterView {
}

protocol SettingsPresenterDelegate {
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: SettingsPresenterView
    let delegate: SettingsPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: SettingsPresenterView,
        delegate: SettingsPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
}
