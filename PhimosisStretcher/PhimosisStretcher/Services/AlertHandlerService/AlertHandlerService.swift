//
//  AlertHandlerService.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class AlertHandlerService: AlertHandlerServiceProtocol {
    
    init() {}
    
    func showWarningAlert(view: UIViewController, message: String) {
        let alert = UIAlertController(
            title: "Warning",
            message: message,
            preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func showDeletionAlert(view: UIViewController, message: String, deleteAction: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(
            title: "Confirm Deletion",
            message: message,
            preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
            title: "Delete",
            style: .destructive,
            handler: deleteAction))
            
            alert.addAction(UIAlertAction(title: "Cancel",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func showSaveChangesFailedAlert(view: UIViewController) {
        let alert = UIAlertController(
            title: "Something went wrong on our end",
            message: "We couldn't save your changes, please try again. \n \n If this continues, please email support.",
            preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func showCustomAlert(view: UIViewController, title: String, message: String, actionTitles:[String?], actions: [((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert)
        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(
                title: title,
                style: .default,
                handler: actions[index])
            
            alert.addAction(action)
        }
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func showGeneralErrorAlert(view: UIViewController) {
        let alert = UIAlertController(
            title: "Oh no",
            message: "Apologies, something went wrong on our end; please restart the app. \n\n If this continues to occur please email support.",
            preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    func showNetworkConnectivityLostAlert(view: UIViewController) {
        let alert = UIAlertController(
            title: "Network Connectivity Lost",
            message: "Connection to your phones internet has been lost, please reconnect to continue using the app. \n\n On reconnection, this alert will disappear.",
            preferredStyle: UIAlertController.Style.alert)
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}

