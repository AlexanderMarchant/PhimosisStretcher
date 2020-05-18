//
//  WorkoutPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

enum WorkoutInstruction: String {
    case stretch = "Stretch"
    case prepare = "Prepare"
    case rest = "Rest"
}

protocol WorkoutPresenterView: AdvertScreenPresenterView {
    func workoutDidResume()
    func workoutDidPause()
    func workoutDidComplete()
    func timeStringDidUpdate(_ time: String)
    func instructionDidUpdate(instruction: String, backgroundColor: UIColor)
    func didCompleteRep(repsLeft: Int)
}

protocol WorkoutPresenterDelegate: AdvertScreenPresenterDelegate {
    func didCompleteWorkout()
    func didCancelWorkout()
}

class WorkoutPresenter: AdvertScreenPresenter, WorkoutPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let workoutCueService: WorkoutCueServiceProtocol
    var timerService: TimerServiceProtocol
    let workoutView: WorkoutPresenterView
    let workoutDelegate: WorkoutPresenterDelegate
    
    let repsPerSet: Int
    let repLength: Int
    let restLength: Int
    let prepareLength: Int
    
    var useVibrateCues: Bool
    var useVisualCues: Bool
    var useAudioCues: Bool
    
    var secondsRemaining = 10
    var milliseconds = 100
    var currentRep = 0
    var isWorkoutState = false
    var isRestState = false
    var isPrepareState = false
    
    init(
        _ adServerService: AdServerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        _ workoutCueService: WorkoutCueServiceProtocol,
        _ timerService: TimerServiceProtocol,
        with view: WorkoutPresenterView,
        delegate: WorkoutPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.workoutCueService = workoutCueService
        self.timerService = timerService
        self.workoutView = view
        self.workoutDelegate = delegate
        
        self.repsPerSet = userDefaultsService.integer(forKey: Constants.repsPerWorkout)
        self.repLength = userDefaultsService.integer(forKey: Constants.repLength)
        self.restLength = userDefaultsService.integer(forKey: Constants.restLength)
        self.prepareLength = userDefaultsService.integer(forKey: Constants.prepareLength)
        
        self.useVibrateCues = userDefaultsService.bool(forKey: Constants.useVibrateCues)
        self.useVisualCues = userDefaultsService.bool(forKey: Constants.useVisualCues)
        self.useAudioCues = userDefaultsService.bool(forKey: Constants.useAudioCues)
        
        super.init(
            adServerService,
            with: view,
            delegate: delegate)
        
        self.timerService.delegate = self
        
        secondsRemaining = prepareLength
        
        timerService.start(delayTime: TimeInterval(exactly: prepareLength)!)
        timerService.pause()
        isPrepareState = true
    }
    
    func beginWorkout() {
        
        timerService.start(delayTime: TimeInterval(prepareLength))
        
        updateViewInstruction(.prepare, backgroundColor: UIColor.prepareBackgroundColour)
        
        self.workoutView.didCompleteRep(repsLeft: repsPerSet - currentRep)
        self.workoutView.workoutDidResume()
    }
    
    func resumeWorkout() {
        
        var instruction: WorkoutInstruction!
        var backgroundColor: UIColor!
        
        if (isRestState) {
            instruction = .rest
            backgroundColor = UIColor.restBackgroundColour
        } else if (isPrepareState) {
            instruction = .prepare
            backgroundColor = UIColor.prepareBackgroundColour
        } else {
            isWorkoutState = true
            instruction = .stretch
            backgroundColor = UIColor.workoutBackgroundColour
        }

        timerService.resume()
        updateViewInstruction(instruction, backgroundColor: backgroundColor)
        self.workoutView.didCompleteRep(repsLeft: repsPerSet - currentRep)
        self.workoutView.workoutDidResume()
    }
    
    func pauseWorkout() {
        timerService.pause()
        self.workoutView.workoutDidPause()
    }
    
    func closeWorkout() {
        timerService.pause()
        self.workoutDelegate.didCancelWorkout()
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
                    self.workoutView.didCompleteRep(repsLeft: repsPerSet - currentRep)
                    
                    queueRep()
                }
            } else {
                timerService.pause()
                
                if(useAudioCues) {
                    workoutCueService.playWorkoutCompleteAudioCue()
                }
                
                self.workoutDelegate.didCompleteWorkout()
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
        
        self.workoutView.timeStringDidUpdate(timerString)
    }
    
    internal func queueRep() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(repLength))
        secondsRemaining = repLength - 1
        
        updateViewInstruction(.stretch, backgroundColor: UIColor.workoutBackgroundColour)
    }
    
    internal func queueRest() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(restLength))
        secondsRemaining = restLength - 1
        
        updateViewInstruction(.rest, backgroundColor: UIColor.restBackgroundColour)
    }
    
    internal func queuePrepare() {
        timerService.pause()
        timerService.start(delayTime: TimeInterval(prepareLength))
        secondsRemaining = prepareLength - 1
        
        updateViewInstruction(.prepare, backgroundColor: UIColor.prepareBackgroundColour)
    }
    
    internal func updateViewInstruction(_ instruction: WorkoutInstruction, backgroundColor: UIColor) {
        
        if(useAudioCues) {
            switch instruction {
            case .stretch:
                workoutCueService.playBeginAudioCue()
                break
            case .rest:
                workoutCueService.playRestAudioCue()
                break
            case .prepare:
                workoutCueService.playPrepareAudioCue()
                break
            }
        }
        
        if(useVibrateCues) {
            workoutCueService.playVibrateCue()
        }
        
        if(useVisualCues) {
            self.workoutView.instructionDidUpdate(instruction: instruction.rawValue, backgroundColor: backgroundColor)
        } else {
            self.workoutView.instructionDidUpdate(instruction: instruction.rawValue, backgroundColor: UIColor.workoutBackgroundColour)
        }
    }
    
}

extension WorkoutPresenter: TimerServiceDelegate {
    func workoutTimerDidChange() {
        self.timerDidChange()
    }
}
