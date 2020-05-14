//
//  WorkoutCompletePresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutCompletePresenterTests: XCTestCase {

    var workoutCompletePresenter: WorkoutCompletePresenter!
    var mockWorkoutCompletePresenterView: MockWorkoutCompletePresenterView!
    var mockWorkoutCompletePresenterDelegate: MockWorkoutCompletePresenterDelegate!

    override func setUp() {
        mockWorkoutCompletePresenterView = MockWorkoutCompletePresenterView()
        mockWorkoutCompletePresenterDelegate = MockWorkoutCompletePresenterDelegate()
        
        workoutCompletePresenter = WorkoutCompletePresenter(
            with: mockWorkoutCompletePresenterView,
            delegate: mockWorkoutCompletePresenterDelegate)
    }

    override func tearDown() {
        workoutCompletePresenter = nil
        mockWorkoutCompletePresenterView = nil
        mockWorkoutCompletePresenterDelegate = nil
    }
}
