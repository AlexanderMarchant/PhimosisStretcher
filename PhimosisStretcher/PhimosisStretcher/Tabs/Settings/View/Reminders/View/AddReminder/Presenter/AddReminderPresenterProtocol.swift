//
//  AddReminderPresenterProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol AddReminderPresenterProtocol {
    func addReminder(time: Date, message: String?, useSound: Bool)
}
