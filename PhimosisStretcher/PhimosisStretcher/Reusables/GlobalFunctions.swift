//
//  GlobalFunctions.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

class GlobalFunctions {
    
    static func calculateTotalWorkoutTime(_ repsPerWorkout: Int, _ repLength: Int, _ restLength: Int, _ prepareLength: Int) -> String {
        let totalRepLength = repLength * repsPerWorkout
        
        // Minus 1 because the last rep does not have a rest
        let totalRestLength = repLength * (repsPerWorkout - 1)
        
        let totalPrepareLength = prepareLength * repsPerWorkout
        
        let totalLength = totalRepLength + totalRestLength + totalPrepareLength
        
        let totalLengthMins = totalLength / 60 % 60
        let totalLengthSeconds = totalLength % 60
        
        return "\(totalLengthMins) mins \(totalLengthSeconds) secs"
    }
    
}
