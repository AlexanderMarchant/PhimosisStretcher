//
//  InformationScreenPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol InformationScreenPresenterView {
    func errorOccurred(message: String)
}

protocol InformationScreenPresenterDelegate {
    func didTapClose()
}

class InformationScreenPresenter: InformationScreenPresenterProtocol {
    
    let view: InformationScreenPresenterView
    let delegate: InformationScreenPresenterDelegate
    
    init(with view: InformationScreenPresenterView, delegate: InformationScreenPresenterDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func didTapClose() {
        self.delegate.didTapClose()
    }
    
}

