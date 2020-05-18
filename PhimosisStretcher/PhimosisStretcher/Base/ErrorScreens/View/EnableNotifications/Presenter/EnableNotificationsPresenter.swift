//
//  EnableNotificationsPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol EnableNotificationsPresenterView: InformationScreenPresenterView {
    
}

protocol EnableNotificationsPresenterDelegate: InformationScreenPresenterDelegate {
}

class EnableNotificationsPresenter: InformationScreenPresenter, EnableNotificationsPresenterProtocol {
    
    let enableNotificationsPresenterView: EnableNotificationsPresenterView
    let enableNotificationsPresenterDelegate: EnableNotificationsPresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        with view: EnableNotificationsPresenterView,
        delegate: EnableNotificationsPresenterDelegate) {
        
        self.enableNotificationsPresenterView = view
        self.enableNotificationsPresenterDelegate = delegate
        
        super.init(adServerService, with: view, delegate: delegate)
    }
    
    func didTapEnableNotifications() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
