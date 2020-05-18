//
//  WorkoutMenuPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutMenuPresenterTests: XCTestCase {
    
    var workoutMenuPresenter: WorkoutMenuPresenter!
    var mockAdServerService: MockAdServerService!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockWorkoutMenuPresenterView: MockWorkoutMenuPresenterView!
    var mockWorkoutMenuPresenterDelegate: MockWorkoutMenuPresenterDelegate!

    override func setUpWithError() throws {
        mockAdServerService = MockAdServerService()
        mockUserDefaultsService = MockUserDefaultsService()
        mockWorkoutMenuPresenterView = MockWorkoutMenuPresenterView()
        mockWorkoutMenuPresenterDelegate = MockWorkoutMenuPresenterDelegate()
        
        mockUserDefaultsService.getIntValueReturnValue = 5
        
        workoutMenuPresenter = WorkoutMenuPresenter(
            mockAdServerService,
            mockUserDefaultsService,
            with: mockWorkoutMenuPresenterView,
            delegate: mockWorkoutMenuPresenterDelegate)
    }

    override func tearDownWithError() throws {
        workoutMenuPresenter = nil
        mockAdServerService = nil
        mockUserDefaultsService = nil
        mockWorkoutMenuPresenterView = nil
        mockWorkoutMenuPresenterDelegate = nil
    }
    
    func testGetWorkoutInformation_StringIsNil() {
        // Arrange
        mockUserDefaultsService.getIntValueReturnValue = 5
        mockUserDefaultsService.getStringValueReturnValue = nil
        
        // Act
        workoutMenuPresenter.getWorkoutInformation()
        
        // Assert
        XCTAssertEqual(2, mockUserDefaultsService.getIntValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.getStringValueCallCount)
        
        XCTAssertEqual(1, mockWorkoutMenuPresenterView.didGetWorkoutInformationCallCount)
    }
    
    func testGetWorkoutInformation() {
        // Arrange
        mockUserDefaultsService.getIntValueReturnValue = 5
        mockUserDefaultsService.getStringValueReturnValue = "500"
        
        // Act
        workoutMenuPresenter.getWorkoutInformation()
        
        // Assert
        XCTAssertEqual(2, mockUserDefaultsService.getIntValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.getStringValueCallCount)
        
        XCTAssertEqual(1, mockWorkoutMenuPresenterView.didGetWorkoutInformationCallCount)
    }
    
    func testStartWorkout() {
        // Arrange/Act
        workoutMenuPresenter.startWorkout()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutMenuPresenterDelegate.didStartWorkoutCallCount)
    }

}
