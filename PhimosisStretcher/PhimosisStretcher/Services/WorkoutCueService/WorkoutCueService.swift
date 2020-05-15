//
//  WorkoutCueService.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import AVFoundation

class WorkoutCueService: WorkoutCueServiceProtocol {
    
    var _audioPlayer = AVAudioPlayer()
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
    
    func playBeginAudioCue() {
        do {
            self._audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Begin", ofType: "wav")!))
            self._audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    func playRestAudioCue() {
        do {
            self._audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Rest", ofType: "wav")!))
            self._audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    func playPrepareAudioCue() {
        do {
//            self._audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Prepare", ofType: "wav")!))
//            self._audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    func playWorkoutCompleteAudioCue() {
        do {
            self._audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Workout Complete", ofType: "wav")!))
            self._audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    func playVibrateCue() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}

