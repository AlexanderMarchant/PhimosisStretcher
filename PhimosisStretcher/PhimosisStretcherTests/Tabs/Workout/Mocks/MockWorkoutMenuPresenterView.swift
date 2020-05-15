//
//  MockWorkoutMenuPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutMenuPresenterView: MockObjectProtocol, WorkoutMenuPresenterView {
    
    var didGetWorkoutInformationCallCount = 0
    
    func resetCallCounts() {
        self.didGetWorkoutInformationCallCount = 0
    }
    
    func didGetWorkoutInformation(_ numberOfWorkoutsToday: Int, _ targetWorkoutsPerDay: Int, _ workoutTime: String) {
        didGetWorkoutInformationCallCount += 1
    }
}
