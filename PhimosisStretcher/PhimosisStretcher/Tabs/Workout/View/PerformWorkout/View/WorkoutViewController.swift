//
//  WorkoutViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController, Storyboarded {
    
    var workoutPresenter: WorkoutPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet var repsLeftLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    
    @IBOutlet var resumeWorkoutButton: PSPrimaryButton!
    @IBOutlet var pauseWorkoutButton: PSDestructiveButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "00:00:00"
        
        manageButtons(isPaused: true)
        
        resumeWorkoutButton.addTarget(self, action: #selector(beginWorkoutButtonTapped), for: .touchUpInside)
        pauseWorkoutButton.addTarget(self, action: #selector(pauseWorkoutButtonTapped), for: .touchUpInside)
    }
    
    @objc func beginWorkoutButtonTapped() {
        workoutPresenter.resumeWorkout()
    }
    
    @objc func pauseWorkoutButtonTapped() {
        workoutPresenter.pauseWorkout()
    }
    
    internal func manageButtons(isPaused: Bool) {
        if(isPaused) {
            resumeWorkoutButton.isHidden = false
            resumeWorkoutButton.isEnabled = true
            
            pauseWorkoutButton.isHidden = true
            pauseWorkoutButton.isEnabled = false
        } else {
            resumeWorkoutButton.isHidden = true
            resumeWorkoutButton.isEnabled = false
            
            pauseWorkoutButton.isHidden = false
            pauseWorkoutButton.isEnabled = true
        }
    }

}

extension WorkoutViewController: WorkoutPresenterView {
    func workoutDidPause() {
        manageButtons(isPaused: true)
    }
    
    func workoutDidResume() {
        manageButtons(isPaused: false)
    }
    
    func workoutDidComplete() {
        manageButtons(isPaused: true)
    }
}
