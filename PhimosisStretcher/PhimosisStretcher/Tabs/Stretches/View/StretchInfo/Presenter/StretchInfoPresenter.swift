//
//  StretchInfoPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol StretchInfoPresenterView {
    func didGetStretchInfo(_ stretchInfo: StretchInfo)
}

protocol StretchInfoPresenterDelegate {
}

class StretchInfoPresenter: StretchInfoPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: StretchInfoPresenterView
    let delegate: StretchInfoPresenterDelegate
    
    let stretchInfo: StretchInfo
    
    init(
        _ stretchInfo: StretchInfo,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: StretchInfoPresenterView,
        delegate: StretchInfoPresenterDelegate) {
        
        self.stretchInfo = stretchInfo
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
    func getStretchInfo() {
        self.view.didGetStretchInfo(stretchInfo)
    }
    
}
