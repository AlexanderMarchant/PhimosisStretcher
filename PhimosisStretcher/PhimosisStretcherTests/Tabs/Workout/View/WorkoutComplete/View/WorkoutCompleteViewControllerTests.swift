//
//  WorkoutCompleteViewControllerTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutCompleteViewControllerTests: XCTestCase {

    var workoutCompleteViewController: WorkoutCompleteViewController!
    var mockWorkoutCompletePresenter: MockWorkoutCompletePresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUp(){
        mockWorkoutCompletePresenter = MockWorkoutCompletePresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        workoutCompleteViewController = WorkoutCompleteViewController.instantiate(storyboard: "WorkoutComplete")
        
        workoutCompleteViewController.advertScreenPresenter = mockWorkoutCompletePresenter
        workoutCompleteViewController.informationScreenPresenter = mockWorkoutCompletePresenter
        workoutCompleteViewController.workoutCompletePresenter = mockWorkoutCompletePresenter
        workoutCompleteViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(workoutCompleteViewController.view)
        
        mockWorkoutCompletePresenter.resetCallCounts()
    }

    override func tearDown() {
        workoutCompleteViewController = nil
        mockWorkoutCompletePresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange
        let ENABLE_NOTIFICATIONS_IMAGE = UIImage(named: "workout-complete", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        // Act
        workoutCompleteViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(ENABLE_NOTIFICATIONS_IMAGE, workoutCompleteViewController.screenImage.image)
        
        XCTAssertEqual("Workout Complete!", workoutCompleteViewController.screenTitle.text)
        XCTAssertEqual("Nice work, that's another workout completed, you're now one step closer!", workoutCompleteViewController.screenDescription.text)
        
        XCTAssertEqual("Easy Work", workoutCompleteViewController.primaryButton.currentTitle!)
        XCTAssertEqual("High Five", workoutCompleteViewController.secondaryButton.currentTitle!)
        XCTAssertTrue(workoutCompleteViewController.secondaryButton.isHidden)
        XCTAssertFalse(workoutCompleteViewController.secondaryButton.isEnabled)
        
        XCTAssertEqual(1, mockWorkoutCompletePresenter.getInterstitialAdCallCount)
    }
    
    func testPrimaryButtonTapped() {
        // Arrange/Act
        workoutCompleteViewController.primaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutCompletePresenter.didTapCloseCallCount)
    }
    
    func testSecondaryButtonTapped() {
        // Arrange/Act
        workoutCompleteViewController.secondaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutCompletePresenter.didTapCloseCallCount)
    }

}
