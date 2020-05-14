//
//  WorkoutPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol WorkoutPresenterView {
    func workoutDidResume()
    func workoutDidPause()
    func workoutDidComplete()
    func timeStringDidUpdate(_ time: String)
    func instructionDidUpdate(instruction: String, backgroundColor: UIColor)
    func didCompleteRep(repsLeft: Int)
}

protocol WorkoutPresenterDelegate {
    func didCompleteWorkout()
}

class WorkoutPresenter: WorkoutPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    var timerService: TimerServiceProtocol
    let view: WorkoutPresenterView
    let delegate: WorkoutPresenterDelegate
    
    let repsPerSet: Int
    let repLength: Int
    let restLength: Int
    let prepareLength: Int
    
    var dispatchWorkItem = DispatchWorkItem(block: {})
    var secondsRemaining = 10
    var milliseconds = 100
    var currentRep = 0
    var isWorkoutState = false
    var isRestState = false
    var isPrepareState = false
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        _ timerService: TimerServiceProtocol,
        with view: WorkoutPresenterView,
        delegate: WorkoutPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.timerService = timerService
        self.view = view
        self.delegate = delegate
        
//        self.repsPerSet = userDefaultsService.integer(forKey: Constants.repsPerSet)
//        self.repLength = userDefaultsService.integer(forKey: Constants.repLength)
//        self.restLength = userDefaultsService.integer(forKey: Constants.restLength)
//        self.prepareLength = userDefaultsService.integer(forKey: Constants.prepareLength)
        
        self.repsPerSet = 10
        self.repLength = 30
        self.restLength = 10
        self.prepareLength = 10
        
        self.timerService.delegate = self
        
        secondsRemaining = prepareLength
        
        timerService.start(delayTime: TimeInterval(exactly: prepareLength)!)
        timerService.pause()
        isPrepareState = true
    }
    
    func beginWorkout() {
        timerService.start(delayTime: TimeInterval(prepareLength))
        self.view.instructionDidUpdate(instruction: "Prepare", backgroundColor: UIColor.prepareBackgroundColour)
        self.view.didCompleteRep(repsLeft: repsPerSet - 1 - currentRep)
        self.view.workoutDidResume()
    }
    
    func resumeWorkout() {
        
        var instruction: String!
        var backgroundColor: UIColor!
        
        if (isRestState) {
            instruction = "Rest"
            backgroundColor = UIColor.restBackgroundColour
        } else if (isPrepareState) {
            instruction = "Prepare"
            backgroundColor = UIColor.prepareBackgroundColour
        } else {
            isWorkoutState = true
            instruction = "Stretch"
            backgroundColor = UIColor.workoutBackgroundColour
        }

        timerService.resume()
        self.view.instructionDidUpdate(instruction: instruction, backgroundColor: backgroundColor)
        self.view.didCompleteRep(repsLeft: repsPerSet - 1 - currentRep)
        self.view.workoutDidResume()
    }
    
    func pauseWorkout() {
        dispatchWorkItem.cancel()
        timerService.pause()
        self.view.workoutDidPause()
    }
    
    func closeWorkout() {
        self.delegate.didCompleteWorkout()
    }
    
    @objc func timerDidChange() {
        milliseconds -= 1
        if(milliseconds == 0)
        {
            secondsRemaining -= 1
            milliseconds = 99
        }
        
        if(secondsRemaining == -1)
        {
            updateTimeString(time: TimeInterval(0), milliseconds: 0)
            
            if(currentRep < repsPerSet - 1) {
                if(isWorkoutState) {
                    self.currentRep += 1
                    isWorkoutState = false
                    isRestState = true
                    isPrepareState = false
                    
                    self.view.didCompleteRep(repsLeft: repsPerSet - 1 - currentRep)
                    
                    queueRest()
                    
                    self.view.instructionDidUpdate(instruction: "Rest", backgroundColor: UIColor.restBackgroundColour)
                } else if (isRestState) {
                    isWorkoutState = false
                    isRestState = false
                    isPrepareState = true
                    
                    queuePrepare()
                    
                    self.view.instructionDidUpdate(instruction: "Prepare", backgroundColor: UIColor.prepareBackgroundColour)
                } else {
                    isWorkoutState = true
                    isRestState = false
                    isPrepareState = false

                    timerService.pause()
                    timerService.start(delayTime: TimeInterval(repLength))
                    secondsRemaining = repLength - 1
                    
                    self.view.instructionDidUpdate(instruction: "Stretch", backgroundColor: UIColor.workoutBackgroundColour)
                }
            } else {
                self.delegate.didCompleteWorkout()
            }
        } else {
            updateTimeString(time: TimeInterval(secondsRemaining), milliseconds: milliseconds)
        }
    }
    
    internal func updateTimeString(time: TimeInterval, milliseconds: Int)
    {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        let timerString = String(format:"%02i:%02i:%02i", minutes, seconds, milliseconds)
        
        self.view.timeStringDidUpdate(timerString)
    }
    
    internal func queueRest(delay: TimeInterval? = nil) {
        timerService.pause()
        timerService.start(delayTime: delay ?? TimeInterval(restLength))
        secondsRemaining = restLength - 1
    }
    
    internal func queuePrepare(delay: TimeInterval? = nil) {
        timerService.pause()
        timerService.start(delayTime: delay ?? TimeInterval(prepareLength))
        secondsRemaining = prepareLength - 1
    }
    
}

extension WorkoutPresenter: TimerServiceDelegate {
    func workoutTimerDidChange() {
        self.timerDidChange()
    }
}
