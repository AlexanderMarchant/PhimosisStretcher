//
//  Reminder.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

class Reminder: NSObject {
    
    var identifier: String
    var time: Date
    var message: String
    var withSound: Bool
    var isAPendingNotification: Bool
    
    
    init(identifier: String, time: Date, message: String, withSound: Bool, isAPendingNotification: Bool) {
        self.identifier = identifier
        self.time = time
        self.message = message
        self.withSound = withSound
        self.isAPendingNotification = isAPendingNotification
    }
    
}
