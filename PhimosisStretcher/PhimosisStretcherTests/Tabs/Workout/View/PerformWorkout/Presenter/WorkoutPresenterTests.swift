//
//  WorkoutPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutPresenterTests: XCTestCase {
    
    var workoutPresenter: WorkoutPresenter!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockWorkoutPresenterView: MockWorkoutPresenterView!
    var mockWorkoutPresenterDelegate: MockWorkoutPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockWorkoutPresenterView = MockWorkoutPresenterView()
        mockWorkoutPresenterDelegate = MockWorkoutPresenterDelegate()
        
        workoutPresenter = WorkoutPresenter(
            mockUserDefaultsService,
            with: mockWorkoutPresenterView,
            delegate: mockWorkoutPresenterDelegate)
    }

    override func tearDownWithError() throws {
        workoutPresenter = nil
        mockUserDefaultsService = nil
        mockWorkoutPresenterView = nil
        mockWorkoutPresenterDelegate = nil
    }

}
