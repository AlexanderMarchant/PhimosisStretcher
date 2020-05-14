//
//  TimerService.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 13/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol TimerServiceDelegate {
    func workoutTimerDidChange()
}

class TimerService: TimerServiceProtocol {
    
    private enum State {
        case paused
        case resumed
    }
    
    private var state: State = .paused
    
    private var timer : DispatchSourceTimer!
    private var d : Date!
    private var diff : TimeInterval!
    private var f : (()->Void)!
    
    public var timeRemaining : TimeInterval!
    public var workoutTimer = Timer()
    
    public var delegate: TimerServiceDelegate?
    
    func start(delayTime: TimeInterval) {
        timeRemaining = delayTime
        timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: DispatchTime.now() + timeRemaining, repeating: .never)
        timer.setEventHandler(handler: f)
        d = Date()
        
        workoutTimer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: (#selector(workoutTimerDidChange)),
            userInfo: nil,
            repeats: true)
        
        timer.resume()
        state = .resumed
    }
    
    func pause() {
        if state == .paused {
            return
        }
        
        workoutTimer.invalidate()
        timer.cancel()
        diff = Date().timeIntervalSince(d)
        state = .paused
    }
    
    func resume() {
        if state == .resumed {
            return
        } else {
            timeRemaining = timeRemaining - diff
            
            timer = DispatchSource.makeTimerSource()
            timer.schedule(deadline: DispatchTime.now() + timeRemaining, repeating: .never)
            timer.setEventHandler(handler: f)
            d = Date()
            state = .resumed
            
            workoutTimer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: (#selector(workoutTimerDidChange)),
                userInfo: nil,
                repeats: true)
            
            timer.resume()
        }
    }
    
    @objc func workoutTimerDidChange() {
        self.delegate?.workoutTimerDidChange()
    }
}
