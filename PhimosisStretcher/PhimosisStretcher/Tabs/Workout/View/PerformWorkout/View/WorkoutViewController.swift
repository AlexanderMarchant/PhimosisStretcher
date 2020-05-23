//
//  WorkoutViewController.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons

class WorkoutViewController: AdvertScreenViewController, Storyboarded {
    
    var workoutPresenter: WorkoutPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet var repsLeftLabel: RepsLeftLabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    
    @IBOutlet var backButton: MDCFloatingButton!
    @IBOutlet var resumeWorkoutButton: PSPrimaryButton!
    @IBOutlet var pauseWorkoutButton: PSSecondaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "00:00:00"
        
        manageButtons(isPaused: true)
        
        backButton.setImage(UIImage(named: "close-icon")!.withRenderingMode(.alwaysTemplate), for: .normal)
        
        backButton.setBackgroundColor(UIColor.black, for: .normal)
        backButton.setTitleFont(Fonts.buttonFont, for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.setImageTintColor(UIColor.white, for: .normal)
        backButton.setShadowColor(UIColor.clear, for: .normal)
        
        resumeWorkoutButton.addTarget(self, action: #selector(resumeWorkoutButtonTapped), for: .touchUpInside)
        pauseWorkoutButton.addTarget(self, action: #selector(pauseWorkoutButtonTapped), for: .touchUpInside)
        
        workoutPresenter.beginWorkout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        UIApplication.shared.isIdleTimerDisabled = true
        
        reloadAds()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        alertHandlerService.showCustomAlert(
            view: self,
            title: "Stop Workout",
            message: "Are you sure you want to stop this workout?",
            actionTitles: ["Stop", "Cancel"],
            actions: [
                { (alert: UIAlertAction!) in
                    self.workoutPresenter.closeWorkout();
                    UIApplication.shared.isIdleTimerDisabled = true
                },
                { (alert: UIAlertAction!) in print("Don't stop") }
            ]
        )
    }
    
    @objc func resumeWorkoutButtonTapped() {
        workoutPresenter.resumeWorkout()
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    @objc func pauseWorkoutButtonTapped() {
        workoutPresenter.pauseWorkout()
        UIApplication.shared.isIdleTimerDisabled = false
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
    
    func timeStringDidUpdate(_ time: String) {
        self.timerLabel.text = time
    }
    
    func didCompleteRep(repsLeft: Int) {
        var repsLeftText: String!
        
        if(repsLeft == 1) {
            repsLeftText = "\(repsLeft) Rep Left"
        } else {
            repsLeftText = "\(repsLeft) Reps Left"
        }
        
        self.repsLeftLabel.text = repsLeftText
    }
    
    func instructionDidUpdate(instruction: String, backgroundColor: UIColor) {
        self.repsLeftLabel.textColor = backgroundColor
        self.view.backgroundColor = backgroundColor
        self.instructionLabel.text = instruction
    }
}
