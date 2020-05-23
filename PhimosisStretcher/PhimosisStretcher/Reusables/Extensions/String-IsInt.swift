//
//  String-IsInt.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
