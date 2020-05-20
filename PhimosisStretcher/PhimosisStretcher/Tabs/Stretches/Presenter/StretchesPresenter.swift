//
//  StretchesPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol StretchesPresenterView: AdvertScreenPresenterView {
}

protocol StretchesPresenterDelegate: AdvertScreenPresenterDelegate {
    func didSelectStretch(_ selectedStretch: StretchInfo)
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis)
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures)
}

class StretchesPresenter: AdvertScreenPresenter, StretchesPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let stretchesView: StretchesPresenterView
    let stretchesDelegate: StretchesPresenterDelegate
    
    init(
        _ adServiceService: AdServerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: StretchesPresenterView,
        delegate: StretchesPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.stretchesView = view
        self.stretchesDelegate = delegate
        
        super.init(
            adServiceService,
            with: view,
            delegate: delegate)
    }
    
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis) {
        self.stretchesDelegate.didSelectUnderstandingPhimosis(understandingPhimosis)
    }
    
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        self.stretchesDelegate.didSelectSafetyMeasures(safetyMeasures)
    }
    
    func didSelectStretch(_ selectedStretch: StretchInfo) {
        self.stretchesDelegate.didSelectStretch(selectedStretch)
    }
    
}
