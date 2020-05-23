//
//  UnderstandingPhimosisPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 20/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol UnderstandingPhimosisPresenterView {
    func didGetInfo(_ understandingPhimosis: UnderstandingPhimosis)
}

protocol UnderstandingPhimosisPresenterDelegate {
}

class UnderstandingPhimosisPresenter: UnderstandingPhimosisPresenterProtocol {
    
    let view: UnderstandingPhimosisPresenterView
    let delegate: UnderstandingPhimosisPresenterDelegate
    
    let understandingPhimosis: UnderstandingPhimosis
    
    init(
        _ understandingPhimosis: UnderstandingPhimosis,
        with view: UnderstandingPhimosisPresenterView,
        delegate: UnderstandingPhimosisPresenterDelegate) {
        
        self.understandingPhimosis = understandingPhimosis
        self.view = view
        self.delegate = delegate
    }
    
    func getInfo() {
        self.view.didGetInfo(understandingPhimosis)
    }
    
}
