//
//  WashYourHandsPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WashYourHandsPresenterView: InformationScreenPresenterView {
    
}

protocol WashYourHandsPresenterDelegate: InformationScreenPresenterDelegate {
    func didTapContinue()
}

class WashYourHandsPresenter: InformationScreenPresenter, WashYourHandsPresenterProtocol {
    
    let washYourHandsPresenterView: WashYourHandsPresenterView
    let washYourHandsPresenterDelegate: WashYourHandsPresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        with view: WashYourHandsPresenterView,
        delegate: WashYourHandsPresenterDelegate) {
        
        self.washYourHandsPresenterView = view
        self.washYourHandsPresenterDelegate = delegate
        
        super.init(adServerService, with: view, delegate: delegate)
    }
    
    func didTapContinue() {
        self.washYourHandsPresenterDelegate.didTapContinue()
    }
}
