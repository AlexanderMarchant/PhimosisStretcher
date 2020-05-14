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
        
        mockUserDefaultsService.getIntValueReturnValue = 5
        
        workoutPresenter = WorkoutPresenter(
            mockUserDefaultsService,
            mockTimerService,
            with: mockWorkoutPresenterView,
            delegate: mockWorkoutPresenterDelegate)
        
        XCTAssertEqual(4, mockUserDefaultsService.getIntValueCallCount)
        
        mockUserDefaultsService.resetCallCounts()
        mockTimerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        workoutPresenter = nil
        mockUserDefaultsService = nil
        mockTimerService = nil
        mockWorkoutPresenterView = nil
        mockWorkoutPresenterDelegate = nil
    }
    
    func testBeingWorkout() {
        // Arrange/Act
        workoutPresenter.beginWorkout()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.startCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Prepare", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.prepareBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.workoutDidResumeCallCount)
    }
    
    func testResumeWorkout_RestState() {
        // Arrange
        workoutPresenter.isRestState = true
        workoutPresenter.isPrepareState = false
        
        // Act
        workoutPresenter.resumeWorkout()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.resumeCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Rest", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.restBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.workoutDidResumeCallCount)
    }
    
    func testResumeWorkout_PrepareState() {
        // Arrange
        workoutPresenter.isRestState = false
        workoutPresenter.isPrepareState = true
        
        // Act
        workoutPresenter.resumeWorkout()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.resumeCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Prepare", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.prepareBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.workoutDidResumeCallCount)
    }
    
    func testResumeWorkout_WorkoutState() {
        // Arrange
        workoutPresenter.isRestState = false
        workoutPresenter.isPrepareState = false
        
        // Act
        workoutPresenter.resumeWorkout()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.resumeCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Stretch", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.workoutBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.workoutDidResumeCallCount)
        
        XCTAssertTrue(workoutPresenter.isWorkoutState)
    }
    
    func testPauseWorkout() {
        // Arrange/Act
        workoutPresenter.pauseWorkout()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutPresenterView.workoutDidPauseCallCount)
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
    }
    
    func testCloseWorkout() {
        // Arrange/Act
        workoutPresenter.closeWorkout()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutPresenterDelegate.didCancelWorkoutCallCount)
    }
    
    func testTimerDidChange_SecondsIsGreaterThan0_MillisecondsIsGreaterThan0() {
        // Arrange
        let SECONDS = 10
        let MILLISECONDS = 50
        
        let EXPECTED_SECONDS = 10
        let EXPECTED_MILLISECONDS = 49
        
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }
    
    func testTimerDidChange_SecondsIsGreaterThan0_MillisecondsIs0() {
        // Arrange
        let SECONDS = 10
        let MILLISECONDS = 0
        
        let EXPECTED_SECONDS = 9
        let EXPECTED_MILLISECONDS = 99
        
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }
    
    func testTimerDidChange_SecondsIs0_MillisecondsIsGreaterThan0() {
        // Arrange
        let SECONDS = 0
        let MILLISECONDS = 50
        
        let EXPECTED_SECONDS = 0
        let EXPECTED_MILLISECONDS = 49
        
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
    }
    
    func testTimerDidChange_SecondsIs0_MillisecondsIs0() {
        // Arrange
        let SECONDS = 0
        let MILLISECONDS = 1
        
        let EXPECTED_SECONDS = -1
        let EXPECTED_MILLISECONDS = 99
        
        workoutPresenter.currentRep = workoutPresenter.repsPerSet
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterDelegate.didCompleteWorkoutCallCount)
        
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
    }
    
    func testTimerDidChange_SecondsIsLessThan0() {
        // Arrange
        let SECONDS = -5
        let MILLISECONDS = 1
        
        let EXPECTED_SECONDS = -6
        let EXPECTED_MILLISECONDS = 99
        
        workoutPresenter.currentRep = workoutPresenter.repsPerSet
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
        
        XCTAssertEqual(1, mockWorkoutPresenterDelegate.didCompleteWorkoutCallCount)
        
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
    }
    
    func testTimerDidChange_TimerFinished_WorkoutState() {
        // Arrange
        let SECONDS = 0
        let MILLISECONDS = 1
        let CURRENT_REP = 0
        
        let EXPECTED_SECONDS = workoutPresenter.restLength - 1
        let EXPECTED_MILLISECONDS = 99
        let EXPECTED_CURRENT_REP = 0
        
        workoutPresenter.isWorkoutState = true
        workoutPresenter.isRestState = false
        workoutPresenter.isPrepareState = false
        workoutPresenter.currentRep = CURRENT_REP
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        XCTAssertEqual(EXPECTED_CURRENT_REP, workoutPresenter.currentRep)
        
        XCTAssertFalse(workoutPresenter.isWorkoutState)
        XCTAssertTrue(workoutPresenter.isRestState)
        XCTAssertFalse(workoutPresenter.isPrepareState)
        
        XCTAssertEqual(0, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Rest", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.restBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockTimerService.startCallCount)
    }
    
    func testTimerDidChange_TimerFinished_RestState() {
        // Arrange
        let SECONDS = 0
        let MILLISECONDS = 1
        let CURRENT_REP = 1
        
        let EXPECTED_SECONDS = workoutPresenter.prepareLength - 1
        let EXPECTED_MILLISECONDS = 99
        let EXPECTED_CURRENT_REP = 1
        
        workoutPresenter.isWorkoutState = false
        workoutPresenter.isRestState = true
        workoutPresenter.isPrepareState = false
        workoutPresenter.currentRep = CURRENT_REP
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        XCTAssertEqual(EXPECTED_CURRENT_REP, workoutPresenter.currentRep)
        
        XCTAssertFalse(workoutPresenter.isWorkoutState)
        XCTAssertFalse(workoutPresenter.isRestState)
        XCTAssertTrue(workoutPresenter.isPrepareState)
        
        XCTAssertEqual(0, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Prepare", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.prepareBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockTimerService.startCallCount)
    }
    
    func testTimerDidChange_TimerFinished_PrepareState() {
        // Arrange
        let SECONDS = 0
        let MILLISECONDS = 1
        let CURRENT_REP = 1
        
        let EXPECTED_SECONDS = workoutPresenter.repLength - 1
        let EXPECTED_MILLISECONDS = 99
        let EXPECTED_CURRENT_REP = 2
        
        workoutPresenter.isWorkoutState = false
        workoutPresenter.isRestState = false
        workoutPresenter.isPrepareState = true
        workoutPresenter.currentRep = CURRENT_REP
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.timerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        XCTAssertEqual(EXPECTED_CURRENT_REP, workoutPresenter.currentRep)
        
        XCTAssertTrue(workoutPresenter.isWorkoutState)
        XCTAssertFalse(workoutPresenter.isRestState)
        XCTAssertFalse(workoutPresenter.isPrepareState)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.didCompleteRepCallCount)
        XCTAssertEqual(1, mockWorkoutPresenterView.instructionDidUpdateCallCount)
        XCTAssertEqual("Stretch", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.workoutBackgroundColour, mockWorkoutPresenterView.backgroundColor)
        
        XCTAssertEqual(1, mockTimerService.startCallCount)
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
    
    func testQueueRest() {
        // Arrange
        let DELAY = TimeInterval(workoutPresenter.restLength)
        let SECONDS_REMAINING = workoutPresenter.restLength - 1
        
        // Act
        workoutPresenter.queueRest()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
        XCTAssertEqual(1, mockTimerService.startCallCount)
        XCTAssertEqual(DELAY, mockTimerService.startDelayTime)
        
        XCTAssertEqual(SECONDS_REMAINING, workoutPresenter.secondsRemaining)
        
        XCTAssertEqual("Rest", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.restBackgroundColour, mockWorkoutPresenterView.backgroundColor)
    }
    
    func testQueuePrepare() {
        // Arrange
        let DELAY = TimeInterval(workoutPresenter.prepareLength)
        let SECONDS_REMAINING = workoutPresenter.prepareLength - 1
        
        // Act
        workoutPresenter.queuePrepare()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
        XCTAssertEqual(1, mockTimerService.startCallCount)
        XCTAssertEqual(DELAY, mockTimerService.startDelayTime)
        
        XCTAssertEqual(SECONDS_REMAINING, workoutPresenter.secondsRemaining)
        
        XCTAssertEqual("Prepare", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.prepareBackgroundColour, mockWorkoutPresenterView.backgroundColor)
    }
    
    func testQueueRep() {
        // Arrange
        let DELAY = TimeInterval(workoutPresenter.repLength)
        let SECONDS_REMAINING = workoutPresenter.repLength - 1
        
        // Act
        workoutPresenter.queueRep()
        
        // Assert
        XCTAssertEqual(1, mockTimerService.pauseCallCount)
        XCTAssertEqual(1, mockTimerService.startCallCount)
        XCTAssertEqual(DELAY, mockTimerService.startDelayTime)
        
        XCTAssertEqual(SECONDS_REMAINING, workoutPresenter.secondsRemaining)
        
        XCTAssertEqual("Stretch", mockWorkoutPresenterView.instruction)
        XCTAssertEqual(UIColor.workoutBackgroundColour, mockWorkoutPresenterView.backgroundColor)
    }
    
    func testTimerServiceDelegate_WorkoutTimerDidChange() {
        // Arrange
        let SECONDS = 10
        let MILLISECONDS = 50
        
        let EXPECTED_SECONDS = 10
        let EXPECTED_MILLISECONDS = 49
        
        workoutPresenter.secondsRemaining = SECONDS
        workoutPresenter.milliseconds = MILLISECONDS
        
        // Act
        workoutPresenter.workoutTimerDidChange()
        
        // Assert
        XCTAssertEqual(EXPECTED_SECONDS, workoutPresenter.secondsRemaining)
        XCTAssertEqual(EXPECTED_MILLISECONDS, workoutPresenter.milliseconds)
        
        XCTAssertEqual(1, mockWorkoutPresenterView.timeStringDidUpdateCallCount)
        
    }

}
