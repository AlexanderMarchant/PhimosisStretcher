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
    func didCancelWorkout()
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
        
        self.repsPerSet = userDefaultsService.integer(forKey: Constants.repsPerWorkout)
        self.repLength = userDefaultsService.integer(forKey: Constants.repLength)
        self.restLength = userDefaultsService.integer(forKey: Constants.restLength)
        self.prepareLength = userDefaultsService.integer(forKey: Constants.prepareLength)
        
        self.timerService.delegate = self
        
        secondsRemaining = prepareLength
        
        timerService.start(delayTime: TimeInterval(exactly: prepareLength)!)
        timerService.pause()
        isPrepareState = true
    }
    
    func beginWorkout() {
        timerService.start(delayTime: TimeInterval(prepareLength))
        self.view.instructionDidUpdate(instruction: "Prepare", backgroundColor: UIColor.prepareBackgroundColour)
        self.view.didCompleteRep(repsLeft: repsPerSet - currentRep)
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
        self.view.didCompleteRep(repsLeft: repsPerSet - currentRep)
        self.view.workoutDidResume()
    }
    
    func pauseWorkout() {
        timerService.pause()
        self.view.workoutDidPause()
    }
    
    func closeWorkout() {
        self.delegate.didCancelWorkout()
    }
    
    @objc func timerDidChange() {
        milliseconds -= 1
        if(milliseconds <= 0)
        {
            secondsRemaining -= 1
            milliseconds = 99
        }
        
        if(secondsRemaining < 0)
        {
            updateTimeString(time: TimeInterval(0), milliseconds: 0)
            
            if(currentRep < repsPerSet) {
                if(isWorkoutState) {
                    isWorkoutState = false
                    isRestState = true
                    isPrepareState = false
                    
                    queueRest()
                } else if (isRestState) {
                    isWorkoutState = false
                    isRestState = false
                    isPrepareState = true
                    
                    queuePrepare()

                } else {
                    isWorkoutState = true
                    isRestState = false
                    isPrepareState = false
                    
                    self.currentRep += 1
                    self.view.didCompleteRep(repsLeft: repsPerSet - currentRep)
                    
                    queueRep()
                }
            } else {
                timerService.pause()
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
    
    internal func queueRep() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(repLength))
        secondsRemaining = repLength - 1
        
        self.view.instructionDidUpdate(instruction: "Stretch", backgroundColor: UIColor.workoutBackgroundColour)
    }
    
    internal func queueRest() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(restLength))
        secondsRemaining = restLength - 1
        
        self.view.instructionDidUpdate(instruction: "Rest", backgroundColor: UIColor.restBackgroundColour)
    }
    
    internal func queuePrepare() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(prepareLength))
        secondsRemaining = prepareLength - 1
        
        self.view.instructionDidUpdate(instruction: "Prepare", backgroundColor: UIColor.prepareBackgroundColour)
    }
    
}

extension WorkoutPresenter: TimerServiceDelegate {
    func workoutTimerDidChange() {
        self.timerDidChange()
    }
}
