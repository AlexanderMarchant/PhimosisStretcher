//
//  AddReminderPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UserNotifications

protocol AddReminderPresenterView {
    func errorOccurred(message: String)
}

protocol AddReminderPresenterDelegate {
    func didAddReminder()
}

class AddReminderPresenter: AddReminderPresenterProtocol {
    
    let view: AddReminderPresenterView
    let delegate: AddReminderPresenterDelegate
    
    init(
        with view: AddReminderPresenterView,
        delegate: AddReminderPresenterDelegate) {
        
        self.view = view
        self.delegate = delegate
    }
    
    func addReminder(time: Date, message: String?, useSound: Bool) {
        
        let content = UNMutableNotificationContent()
        content.title = "Workout Time!"
        content.body = message ?? "Lets get this workout done!"
        
        if(useSound) {
            content.sound = UNNotificationSound.default
        }
        
        let triggerTime = Calendar.current.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
        
        let request = UNNotificationRequest(identifier: "PhimosisStretches\(triggerTime)", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        self.delegate.didAddReminder()
    }
    
}

