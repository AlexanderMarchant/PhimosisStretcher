//
//  WorkoutViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutViewControllerTests: XCTestCase {
    
    var workoutViewController: WorkoutViewController!
    var mockWorkoutPresenter: MockWorkoutPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockWorkoutPresenter = MockWorkoutPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        workoutViewController = WorkoutViewController.instantiate(storyboard: "Workout")
        workoutViewController.workoutPresenter = mockWorkoutPresenter
        workoutViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(workoutViewController.view)
    }

    override func tearDownWithError() throws {
        workoutViewController = nil
        mockWorkoutPresenter = nil
        mockAlertHandlerService = nil
    }

}
