//
//  StretchInfoPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol StretchInfoPresenterView {
}

protocol StretchInfoPresenterDelegate {
}

class StretchInfoPresenter: StretchInfoPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: StretchInfoPresenterView
    let delegate: StretchInfoPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: StretchInfoPresenterView,
        delegate: StretchInfoPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
}
