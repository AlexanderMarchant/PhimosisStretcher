//
//  InformationScreenPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol InformationScreenPresenterView: AdvertScreenPresenterView {
    func errorOccurred(message: String)
}

protocol InformationScreenPresenterDelegate: AdvertScreenPresenterDelegate {
    func didTapClose()
}

class InformationScreenPresenter: AdvertScreenPresenter, InformationScreenPresenterProtocol {
    
    let informationScreenView: InformationScreenPresenterView
    let informationScreenDelegate: InformationScreenPresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        with view: InformationScreenPresenterView,
        delegate: InformationScreenPresenterDelegate) {
        self.informationScreenView = view
        self.informationScreenDelegate = delegate
        
        super.init(adServerService, with: view, delegate: delegate)
    }
    
    func didTapClose() {
        self.informationScreenDelegate.didTapClose()
    }
    
}

