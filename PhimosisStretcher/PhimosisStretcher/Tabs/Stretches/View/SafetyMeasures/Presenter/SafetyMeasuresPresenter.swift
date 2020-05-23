//
//  SafetyMeasuresPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 20/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol SafetyMeasuresPresenterView {
    func didGetSafetyMeasures(_ safetyMeasures: SafetyMeasures)
}

protocol SafetyMeasuresPresenterDelegate {
}

class SafetyMeasuresPresenter: SafetyMeasuresPresenterProtocol {
    
    let view: SafetyMeasuresPresenterView
    let delegate: SafetyMeasuresPresenterDelegate
    
    let safetyMeasures: SafetyMeasures
    
    init(
        _ safetyMeasures: SafetyMeasures,
        with view: SafetyMeasuresPresenterView,
        delegate: SafetyMeasuresPresenterDelegate) {
        
        self.safetyMeasures = safetyMeasures
        self.view = view
        self.delegate = delegate
    }
    
    func getSafetyMeasures() {
        self.view.didGetSafetyMeasures(safetyMeasures)
    }
    
}
