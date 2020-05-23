//
//  AlertHandlerServiceProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol AlertHandlerServiceProtocol {
    
    func showWarningAlert(view: UIViewController, message: String)
    
    func showDeletionAlert(view: UIViewController, message: String, deleteAction: ((UIAlertAction) -> Void)?)
    
    func showSaveChangesFailedAlert(view: UIViewController)
    
    func showCustomAlert(view: UIViewController, title: String, message: String, actionTitles: [String?], actions: [((UIAlertAction) -> Void)?])
    
    func showGeneralErrorAlert(view: UIViewController)
    
    func showNetworkConnectivityLostAlert(view: UIViewController)
}
