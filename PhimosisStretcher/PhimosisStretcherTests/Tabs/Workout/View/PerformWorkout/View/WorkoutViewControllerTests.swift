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
        
        let navController = UINavigationController()
        let tabBarController = UITabBarController()
        navController.addChild(tabBarController)
        
        workoutViewController = WorkoutViewController.instantiate(storyboard: "Workout")
        workoutViewController.workoutPresenter = mockWorkoutPresenter
        workoutViewController.alertHandlerService = mockAlertHandlerService
        
        tabBarController.addChild(workoutViewController)
        
        XCTAssertNotNil(workoutViewController.view)
        
        mockWorkoutPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        workoutViewController = nil
        mockWorkoutPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange
        let BACK_BUTTON_IMAGE = UIImage(named: "close-icon", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        
        // Act
        workoutViewController.viewDidLoad()
        
        // Assert
        let resumeWorkoutButtonTarget = workoutViewController.resumeWorkoutButton.allTargets.first(where: { $0.self is WorkoutViewController })
        let resumeWorkoutButtonTargetActionName = workoutViewController
            .resumeWorkoutButton
            .actions(
                forTarget: resumeWorkoutButtonTarget,
                forControlEvent: .touchUpInside)?
            .first!
            
        let pauseWorkoutButtonTarget = workoutViewController.pauseWorkoutButton.allTargets.first(where: { $0.self is WorkoutViewController })
        let pauseWorkoutButtonTargetActionName = workoutViewController
            .pauseWorkoutButton
            .actions(
                forTarget: pauseWorkoutButtonTarget,
                forControlEvent: .touchUpInside)?
            .first!
        
        XCTAssertEqual("00:00:00", workoutViewController.timerLabel.text)
        
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isEnabled)
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isHidden)
        
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isEnabled)
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isHidden)
        
        XCTAssertEqual(BACK_BUTTON_IMAGE, workoutViewController.backButton.imageView!.image!)
        XCTAssertEqual(UIColor.black, workoutViewController.backButton.backgroundColor)
        XCTAssertEqual(UIColor.white, workoutViewController.backButton.imageTintColor(for: .normal))
        XCTAssertEqual(UIColor.clear, workoutViewController.backButton.shadowColor(for: .normal))
        
        XCTAssertEqual(1, mockWorkoutPresenter.resumeWorkoutCallCount)
        
        XCTAssertEqual("resumeWorkoutButtonTapped", resumeWorkoutButtonTargetActionName)
        XCTAssertEqual("pauseWorkoutButtonTapped", pauseWorkoutButtonTargetActionName)
    }
    
    func testViewWillAppear() {
        // Arrange/Act
        workoutViewController.viewWillAppear(true)
        
        // Assert
        XCTAssertTrue((workoutViewController.tabBarController?.tabBar.isHidden)!)
    }
    
    func testViewWillDisappear() {
        // Arrange
        workoutViewController.tabBarController?.tabBar.isHidden = true
        
        // Act
        workoutViewController.viewWillDisappear(true)
        
        // Assert
        XCTAssertFalse((workoutViewController.tabBarController?.tabBar.isHidden)!)
    }
    
    func testCloseButtonTapped() {
        // Arrange/Act
        workoutViewController.closeButtonTapped((Any).self)
        
        // Assert
        XCTAssertEqual(1, mockAlertHandlerService.showCustomAlertCallCount)
    }
    
    func testResumeWorkoutButtonTapped() {
        // Arrange/Act
        workoutViewController.resumeWorkoutButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutPresenter.resumeWorkoutCallCount)
    }
    
    func testPauseeWorkoutButtonTapped() {
        // Arrange/Act
        workoutViewController.pauseWorkoutButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWorkoutPresenter.pauseWorkoutCallCount)
    }
    
    func testManageButtons_NotPaused() {
        // Arrange
        workoutViewController.resumeWorkoutButton.isHidden = false
        workoutViewController.resumeWorkoutButton.isEnabled = true
        
        workoutViewController.pauseWorkoutButton.isHidden = true
        workoutViewController.pauseWorkoutButton.isEnabled = false
        
        // Act
        workoutViewController.manageButtons(isPaused: false)
        
        // Assert
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isHidden)
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isEnabled)
        
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isHidden)
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isEnabled)
    }
    
    func testManageButtons_IsPaused() {
        // Arrange
        workoutViewController.resumeWorkoutButton.isHidden = true
        workoutViewController.resumeWorkoutButton.isEnabled = false
        
        workoutViewController.pauseWorkoutButton.isHidden = false
        workoutViewController.pauseWorkoutButton.isEnabled = true
        
        // Act
        workoutViewController.manageButtons(isPaused: false)
        
        // Assert
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isHidden)
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isEnabled)
        
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isHidden)
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isEnabled)
    }
    
    func testWorkoutPresenterView_WorkoutDidPause() {
        // Arrange
        workoutViewController.resumeWorkoutButton.isHidden = false
        workoutViewController.resumeWorkoutButton.isEnabled = true
        
        workoutViewController.pauseWorkoutButton.isHidden = true
        workoutViewController.pauseWorkoutButton.isEnabled = false
        
        // Act
        workoutViewController.workoutDidPause()
        
        // Assert
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isHidden)
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isEnabled)
        
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isHidden)
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isEnabled)
    }
    
    func testWorkoutPresenterView_WorkoutDidComplete() {
        // Arrange
        workoutViewController.resumeWorkoutButton.isHidden = false
        workoutViewController.resumeWorkoutButton.isEnabled = true
        
        workoutViewController.pauseWorkoutButton.isHidden = true
        workoutViewController.pauseWorkoutButton.isEnabled = false
        
        // Act
        workoutViewController.workoutDidComplete()
        
        // Assert
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isHidden)
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isEnabled)
        
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isHidden)
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isEnabled)
    }
    
    func testWorkoutPresenterView_WorkoutDidResume() {
        // Arrange
        workoutViewController.resumeWorkoutButton.isHidden = false
        workoutViewController.resumeWorkoutButton.isEnabled = true
        
        workoutViewController.pauseWorkoutButton.isHidden = true
        workoutViewController.pauseWorkoutButton.isEnabled = false
        
        // Act
        workoutViewController.workoutDidResume()
        
        // Assert
        XCTAssertTrue(workoutViewController.resumeWorkoutButton.isHidden)
        XCTAssertFalse(workoutViewController.resumeWorkoutButton.isEnabled)
        
        XCTAssertFalse(workoutViewController.pauseWorkoutButton.isHidden)
        XCTAssertTrue(workoutViewController.pauseWorkoutButton.isEnabled)
    }
    
    func testWorkoutPresenterView_TimeStringDidUpdate() {
        // Arrange
        let TIME_STRING = "10:54:23"
        
        // Act
        workoutViewController.timeStringDidUpdate(TIME_STRING)
        
        // Assert
        XCTAssertEqual(TIME_STRING, workoutViewController.timerLabel.text)
    }
    
    func testWorkoutPresenterView_DidCompleteRep() {
        // Arrange
        let REPS_LEFT = 10
        let EXPECTED_STRING = "\(REPS_LEFT) Reps Left"
        
        // Act
        workoutViewController.didCompleteRep(repsLeft: REPS_LEFT)
        
        // Assert
        XCTAssertEqual(EXPECTED_STRING, workoutViewController.repsLeftLabel.text)
    }
    
    func testWorkoutPresenterView_InstructionDidUpdate() {
        // Arrange
        let INSTRUCTION = "Test"
        let BACKGROUND_COLOUR = UIColor.purple
        
        // Act
        workoutViewController.instructionDidUpdate(instruction: INSTRUCTION, backgroundColor: BACKGROUND_COLOUR)
        
        // Assert
        XCTAssertEqual(INSTRUCTION, workoutViewController.instructionLabel.text)
        XCTAssertEqual(BACKGROUND_COLOUR, workoutViewController.view.backgroundColor)
    }

}
