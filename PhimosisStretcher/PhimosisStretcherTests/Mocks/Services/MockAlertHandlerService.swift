//
//  MockAlertHandlerService.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
@testable import PhimosisStretcher

class MockAlertHandlerService: AlertHandlerServiceProtocol {
    var showGeneralErrorAlertCallCount = 0
    
    var message = ""
    var showWarningAlertCallCount = 0
    var showDeletionAlertCallCount = 0
    var showSaveChangesFailedAlertCallCount = 0
    var showCustomAlertCallCount = 0
    var showNetworkConnectivityLostAlertCallCount = 0
    
    func resetCallCounts() {
        self.showGeneralErrorAlertCallCount = 0
        self.showWarningAlertCallCount = 0
        self.showSaveChangesFailedAlertCallCount = 0
        self.showCustomAlertCallCount = 0
    }
    
    func showWarningAlert(view: UIViewController, message: String) {
        showWarningAlertCallCount += 1
        self.message = message
    }
    
    func showDeletionAlert(view: UIViewController, message: String, deleteAction: ((UIAlertAction) -> Void)?) {
        showDeletionAlertCallCount += 1
    }
    
    func showSaveChangesFailedAlert(view: UIViewController) {
        showSaveChangesFailedAlertCallCount += 1
    }
    
    func showCustomAlert(view: UIViewController, title: String, message: String, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        showCustomAlertCallCount += 1
    }
    
    func showGeneralErrorAlert(view: UIViewController) {
        showGeneralErrorAlertCallCount += 1
    }
    
    func showNetworkConnectivityLostAlert(view: UIViewController) {
        showNetworkConnectivityLostAlertCallCount += 1
    }
}
