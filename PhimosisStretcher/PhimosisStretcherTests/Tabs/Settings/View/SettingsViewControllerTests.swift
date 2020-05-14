//
//  SettingsViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class SettingsViewControllerTests: XCTestCase {
    
    var settingsViewController: SettingsViewController!
    var mockSettingsPresenter: MockSettingsPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockSettingsPresenter = MockSettingsPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        settingsViewController = SettingsViewController.instantiate(storyboard: "Settings")
        settingsViewController.settingsPresenter = mockSettingsPresenter
        settingsViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(settingsViewController.view)
    }

    override func tearDownWithError() throws {
        settingsViewController = nil
        mockSettingsPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        settingsViewController.viewDidLoad()
        
        // Assert
        let saveButtonTargetActionName = settingsViewController.navigationItem.rightBarButtonItem!.action?.description
        
        XCTAssertEqual(UIKeyboardType.numberPad, settingsViewController.repsPerWorkoutTextBox.keyboardType)
        XCTAssertEqual(UIKeyboardType.numberPad, settingsViewController.repLengthTextBox.keyboardType)
        XCTAssertEqual(UIKeyboardType.numberPad, settingsViewController.restLengthTextBox.keyboardType)
        XCTAssertEqual(UIKeyboardType.numberPad, settingsViewController.prepareLengthTextBox.keyboardType)
        
        XCTAssertTrue(settingsViewController.repsPerWorkoutTextBox.delegate is SettingsViewController)
        XCTAssertTrue(settingsViewController.repLengthTextBox.delegate is SettingsViewController)
        XCTAssertTrue(settingsViewController.restLengthTextBox.delegate is SettingsViewController)
        XCTAssertTrue(settingsViewController.prepareLengthTextBox.delegate is SettingsViewController)
        
        XCTAssertEqual("Reps Per Workout", settingsViewController.repsPerWorkoutTextBoxController.placeholderText!)
        XCTAssertEqual("Rep Length", settingsViewController.repLengthTextBoxController.placeholderText!)
        XCTAssertEqual("Rest Length", settingsViewController.restLengthTextBoxController.placeholderText!)
        XCTAssertEqual("Prepare Length", settingsViewController.prepareLengthTextBoxController.placeholderText!)
        
        XCTAssertNil(settingsViewController.navigationItem.leftBarButtonItem)
        XCTAssertEqual("saveChanges", saveButtonTargetActionName)
    }
    
    func testViewWillAppear() {
        // Arrange/Act
        settingsViewController.viewWillAppear(true)
        
        // Assert
        XCTAssertEqual(1, mockSettingsPresenter.getWorkoutSettingsCallCount)
    }
    
    func testSaveChanges() {
        // Arrange/Act
        settingsViewController.saveChanges()
        
        // Assert
        XCTAssertEqual(1, mockSettingsPresenter.saveChangesCallCount)
    }
    
    func testSettingsPresenterView_DidGetWorkoutSettings() {
        // Arrange
        let TARGET_WORKOUTS_PER_DAY = "3"
        let REPS_PER_WORKOUT = "15"
        let REP_LENGTH = "30"
        let REST_LENGTH = "5"
        let PREPARE_LENGTH = "10"
        
        // Act
        settingsViewController.didGetWorkoutSettings(TARGET_WORKOUTS_PER_DAY, REPS_PER_WORKOUT, REP_LENGTH, REST_LENGTH, PREPARE_LENGTH)
        
        // Assert
        XCTAssertEqual(REPS_PER_WORKOUT, settingsViewController.repsPerWorkoutTextBox.text)
        XCTAssertEqual(REP_LENGTH, settingsViewController.repLengthTextBox.text)
        XCTAssertEqual(REST_LENGTH, settingsViewController.restLengthTextBox.text)
        XCTAssertEqual(PREPARE_LENGTH, settingsViewController.prepareLengthTextBox.text)
    }
    
    func testSettingsPresenterView_SavedChanges() {
        // Arrange/Act
        settingsViewController.savedChanges()
        
        // Assert
        XCTAssertEqual(1, mockAlertHandlerService.showCustomAlertCallCount)
    }
    
    func testSettingsPresenterView_ErrorOccurred() {
        // Arrange/Act
        settingsViewController.errorOccurred(message: "Error")
        
        // Assert
        XCTAssertEqual(1, mockAlertHandlerService.showWarningAlertCallCount)
    }
    
    func testUITextFieldDelegate_TextFieldShouldReturn() {
        // Arrange/Act
        let result = settingsViewController.textFieldShouldReturn(settingsViewController.restLengthTextBox)
        
        // Assert
        XCTAssertTrue(result)
    }

}
