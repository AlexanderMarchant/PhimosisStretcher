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
    var mockTimerService: MockTimerService!
    var mockWorkoutPresenterView: MockWorkoutPresenterView!
    var mockWorkoutPresenterDelegate: MockWorkoutPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockTimerService = MockTimerService()
        mockWorkoutPresenterView = MockWorkoutPresenterView()
        mockWorkoutPresenterDelegate = MockWorkoutPresenterDelegate()
        
        workoutPresenter = WorkoutPresenter(
            mockUserDefaultsService,
            mockTimerService,
            with: mockWorkoutPresenterView,
            delegate: mockWorkoutPresenterDelegate)
    }

    override func tearDownWithError() throws {
        workoutPresenter = nil
        mockUserDefaultsService = nil
        mockTimerService = nil
        mockWorkoutPresenterView = nil
        mockWorkoutPresenterDelegate = nil
    }
    
    func testCloseWorkout() {
        // Arrange/Act
        workoutPresenter.closeWorkout()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutPresenterDelegate.didCompleteWorkoutCallCount)
    }
    
    func testUpdateTimeString_TimeIsZero() {
        // Arrange
        let TIME_INTERVAL = TimeInterval(exactly: 0)!
        let MILLISECONDS = 0
        let EXPECTED_TIME_STRING = "00:00:00"
        
        // Act
        workoutPresenter.updateTimeString(time: TIME_INTERVAL, milliseconds: MILLISECONDS)
        
        // Assert
        XCTAssertEqual(EXPECTED_TIME_STRING, mockWorkoutPresenterView.timeString)
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }
    
    func testUpdateTimeString_MillisecondsIsZero() {
        // Arrange
        let TIME_INTERVAL = TimeInterval(exactly: 10)!
        let MILLISECONDS = 0
        let EXPECTED_TIME_STRING = "00:10:00"
        
        // Act
        workoutPresenter.updateTimeString(time: TIME_INTERVAL, milliseconds: MILLISECONDS)
        
        // Assert
        XCTAssertEqual(EXPECTED_TIME_STRING, mockWorkoutPresenterView.timeString)
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }
    
    func testUpdateTimeString_Success() {
        // Arrange
        let TIME_INTERVAL = TimeInterval(exactly: 10)!
        let MILLISECONDS = 87
        let EXPECTED_TIME_STRING = "00:10:87"
        
        // Act
        workoutPresenter.updateTimeString(time: TIME_INTERVAL, milliseconds: MILLISECONDS)
        
        // Assert
        XCTAssertEqual(EXPECTED_TIME_STRING, mockWorkoutPresenterView.timeString)
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }

}
