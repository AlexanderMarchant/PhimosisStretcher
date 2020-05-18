//
//  WorkoutMenuViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutMenuViewControllerTests: XCTestCase {
    
    var workoutMenuViewController: WorkoutMenuViewController!
    var mockWorkoutMenuPresenter: MockWorkoutMenuPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockWorkoutMenuPresenter = MockWorkoutMenuPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        workoutMenuViewController = WorkoutMenuViewController.instantiate(storyboard: "WorkoutMenu")
        workoutMenuViewController.advertScreenPresenter = mockWorkoutMenuPresenter
        workoutMenuViewController.workoutMenuPresenter = mockWorkoutMenuPresenter
        workoutMenuViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(workoutMenuViewController.view)
        
        mockWorkoutMenuPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        workoutMenuViewController = nil
        mockWorkoutMenuPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewWillAppear() {
        // Arrange/Act
        workoutMenuViewController.viewWillAppear(true)
        
        // Assert
        XCTAssertEqual(1, mockWorkoutMenuPresenter.getWorkoutInformationCallCount)
    }
    
    func testBeginWorkoutButtonTapped() {
        // Arrange/Act
        workoutMenuViewController.beginWorkoutButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutMenuPresenter.startWorkoutCallCount)
    }
    
    func testWorkoutMenuPresenterView_DidGetWorkoutInformation() {
        // Arrange
        let NUMBER_OF_WORKOUTS_TODAY = 2
        let TARGET_WORKOUTS_PER_DAY = 3
        let WORKOUT_TIME = "5 mins 30 secs"
        
        // Act
        workoutMenuViewController.didGetWorkoutInformation(NUMBER_OF_WORKOUTS_TODAY, TARGET_WORKOUTS_PER_DAY, WORKOUT_TIME)
        
        // Assert
        XCTAssertEqual("\(NUMBER_OF_WORKOUTS_TODAY) / \(TARGET_WORKOUTS_PER_DAY)", workoutMenuViewController.workoutsTodayLabel.text)
        XCTAssertEqual(WORKOUT_TIME, workoutMenuViewController.workoutTimeLabel.text)
    }

}
