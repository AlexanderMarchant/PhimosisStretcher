//
//  SettingsPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
import MessageUI
@testable import PhimosisStretcher

class SettingsPresenterTests: XCTestCase {
    
    var settingsPresenter: SettingsPresenter!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockSettingsPresenterView: MockSettingsPresenterView!
    var mockSettingsPresenterDelegate: MockSettingsPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockSettingsPresenterView = MockSettingsPresenterView()
        mockSettingsPresenterDelegate = MockSettingsPresenterDelegate()
        
        settingsPresenter = SettingsPresenter(
            mockUserDefaultsService,
            with: mockSettingsPresenterView,
            delegate: mockSettingsPresenterDelegate)
    }

    override func tearDownWithError() throws {
        settingsPresenter = nil
        mockUserDefaultsService = nil
        mockSettingsPresenterView = nil
        mockSettingsPresenterDelegate = nil
    }
    
    func testGetWorkoutSettings() {
        // Arrange
        mockUserDefaultsService.getIntValueReturnValue = 5
        
        // Act
        settingsPresenter.getWorkoutSettings()
        
        // Assert
        XCTAssertEqual(5, mockUserDefaultsService.getIntValueCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.didGetWorkoutSettingsCallCount)
    }
    
    func testGetCueSettings() {
        // Arrange
        mockUserDefaultsService.getBoolValueReturnValue = true
        
        // Act
        settingsPresenter.getCueSettings()
        
        // Assert
        XCTAssertEqual(3, mockUserDefaultsService.getBoolValueCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.didGetCueSettingsCallCount)
    }
    
    func testSaveChanges_TargetWorkoutsPerDayIsNil() {
        // Arrange/Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: nil, repsPerWorkout: nil, repLength: nil, restLength: nil, prepareLength: nil)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepsPerWorkoutIsNil() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: nil, repLength: nil, restLength: nil, prepareLength: nil)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepLengthIsNil() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = ""
        let REPS_PER_WORKOUT = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: nil, restLength: nil, prepareLength: nil)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RestLengthIsNil() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = ""
        let REPS_PER_WORKOUT = ""
        let REP_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: nil, prepareLength: nil)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_PrepareLengthtIsNil() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = ""
        let REPS_PER_WORKOUT = ""
        let REP_LENGTH = ""
        let REST_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: nil)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepsPerWorkoutIsEmpty() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = ""
        let REPS_PER_WORKOUT = ""
        let REP_LENGTH = ""
        let REST_LENGTH = ""
        let PREPARE_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepLengthIsEmpty() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = ""
        let REST_LENGTH = ""
        let PREPARE_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RestLengthIsEmpty() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "30"
        let REST_LENGTH = ""
        let PREPARE_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_PrepareLengthtIsEmpty() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "30"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = ""
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepsPerWorkoutIsNotAnInteger() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "Ten"
        let REP_LENGTH = "30"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = "15"
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RepLengthIsNotAnInteger() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "Thirty"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = "15"
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_RestLengthIsNotAnInteger() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "30"
        let REST_LENGTH = "Five"
        let PREPARE_LENGTH = "15"
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_PrepareLengthIsNotAnInteger() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "30"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = "Fifteen"
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(0, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(0, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSaveChanges_Success() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "10"
        let REP_LENGTH = "30"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = "15"
        
        // Act
        settingsPresenter.saveChanges(targetWorkoutsPerDay: TARGET_WORKOUTS_PER_DAY, repsPerWorkout: REPS_PER_WORKOUT, repLength: REP_LENGTH, restLength: REST_LENGTH, prepareLength: PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(6, mockUserDefaultsService.setAnyValueCallCount)
        
        XCTAssertEqual(1, mockSettingsPresenterView.savedChangesCallCount)
        XCTAssertEqual(0, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testSendEmail() {
        // Arrange/Act
        settingsPresenter.sendEmail()
        
        // Assert
        XCTAssertEqual(0, mockSettingsPresenterDelegate.sendEmailCallCount)
        
        XCTAssertEqual(1, mockSettingsPresenterView.errorOccurredCallCount)
    }
    
    func testUpdateVibrateCue() {
        // Arrange
        mockUserDefaultsService.getBoolValueReturnValue = false
        
        // Act
        settingsPresenter.updateVibrateCue()
        
        // Assert
        XCTAssertEqual(1, mockUserDefaultsService.getBoolValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.setBoolValueCallCount)
    }
    
    func testUpdateVisualCue() {
        // Arrange
        mockUserDefaultsService.getBoolValueReturnValue = false
        
        // Act
        settingsPresenter.updateVisualCue()
        
        // Assert
        XCTAssertEqual(1, mockUserDefaultsService.getBoolValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.setBoolValueCallCount)
    }
    
    func testUpdateAudioCue() {
        // Arrange
        mockUserDefaultsService.getBoolValueReturnValue = false
        
        // Act
        settingsPresenter.updateAudioCue()
        
        // Assert
        XCTAssertEqual(1, mockUserDefaultsService.getBoolValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.setBoolValueCallCount)
    }
    
    func testDidSelectReminders_Disabled() {
        // Arrange
        settingsPresenter.notificationsAreEnabled = false
        
        // Act
        settingsPresenter.didSelectReminders()
        
        // Assert
        XCTAssertEqual(0, mockSettingsPresenterDelegate.didSelectRemindersCallCount)
    }
    
    func testDidSelectReminders_Enabled() {
        // Arrange
        settingsPresenter.notificationsAreEnabled = true
        
        // Act
        settingsPresenter.didSelectReminders()
        
        // Assert
        XCTAssertEqual(1, mockSettingsPresenterDelegate.didSelectRemindersCallCount)
    }

}
