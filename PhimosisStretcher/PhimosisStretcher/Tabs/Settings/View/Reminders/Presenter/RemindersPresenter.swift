//
//  RemindersPresenter.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UserNotifications

protocol RemindersPresenterView {
    func didGetReminders(reminders: [Reminder])
    func errorOccurred(message: String)
}

protocol RemindersPresenterDelegate {
    func didTapAddReminder()
}

class RemindersPresenter: RemindersPresenterProtocol {
    
    let view: RemindersPresenterView
    let delegate: RemindersPresenterDelegate
    
    init(
        with view: RemindersPresenterView,
        delegate: RemindersPresenterDelegate) {
        
        self.view = view
        self.delegate = delegate
    }
    
    func addReminder() {
        self.delegate.didTapAddReminder()
    }
    
    func deleteReminder(reminders: [Reminder], deleteAt reminderIndex: Int) {
        
        var reminders = reminders
        
        let center = UNUserNotificationCenter.current()
        
        if(reminderIndex > reminders.count) {
            self.view.errorOccurred(message: "Please try to delete the reminder again")
            return
        }
        
        let reminder = reminders[reminderIndex]
        
        switch(reminder.isAPendingNotification) {
            case true:
                center.removePendingNotificationRequests(withIdentifiers: [reminder.identifier])
            default:
                center.removeDeliveredNotifications(withIdentifiers: [reminder.identifier])
        }
        
        reminders.remove(at: reminderIndex)
        
        self.view.didGetReminders(reminders: reminders)
    }
    
    func getReminders() {
        var reminders = [Reminder]()
        
        let center = UNUserNotificationCenter.current()
        let dq = DispatchQueue.global(qos: .userInteractive)
        dq.async {
            center.getPendingNotificationRequests { (notifications) in
                for item in notifications {
                    if let trigger = item.trigger as? UNCalendarNotificationTrigger,
                        let triggerDate = trigger.nextTriggerDate() {
                        var withSound = true
                        if(item.content.sound != UNNotificationSound.default)
                        {
                            withSound = false
                        }
                        reminders.append(
                            Reminder(identifier: item.identifier,
                                     time: triggerDate,
                                     message: item.content.body,
                                     withSound: withSound,
                                     isAPendingNotification: true))
                    }
                }

                reminders.sort(by: { $0.time.stripDate() < $1.time.stripDate() })
                
                DispatchQueue.main.async {
                    self.view.didGetReminders(reminders: reminders)
                }
            }
        }
    }
    
}
