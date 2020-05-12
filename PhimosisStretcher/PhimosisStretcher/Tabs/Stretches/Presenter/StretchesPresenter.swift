//
//  StretchesPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol StretchesPresenterView {
}

protocol StretchesPresenterDelegate {
    func didSelectStretch()
}

class StretchesPresenter: StretchesPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: StretchesPresenterView
    let delegate: StretchesPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: StretchesPresenterView,
        delegate: StretchesPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
    func didSelectStretch() {
        self.delegate.didSelectStretch()
    }
    
}
