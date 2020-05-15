//
//  WorkoutCueServiceProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutCueServiceProtocol {
    func playBeginAudioCue()
    func playRestAudioCue()
    func playWorkoutCompleteAudioCue()
    func playVibrateCue()
}
