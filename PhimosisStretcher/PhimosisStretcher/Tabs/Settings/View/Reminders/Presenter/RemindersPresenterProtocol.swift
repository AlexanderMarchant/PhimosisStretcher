//
//  RemindersPresenterProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol RemindersPresenterProtocol {
    func addReminder()
    func deleteReminder(reminders: [Reminder], deleteAt reminderIndex: Int)
    func getReminders()
}
