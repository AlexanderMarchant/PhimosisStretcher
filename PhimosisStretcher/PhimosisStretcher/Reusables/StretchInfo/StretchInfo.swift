//
//  StretchInfo.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 19/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

struct StretchInfo: Decodable {
    var title: String
    var stretchInfo: String
    var warning: String
    var image: String
    var steps: String
    var closingText: String
    var references: [String]
}
