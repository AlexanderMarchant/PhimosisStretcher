//
//  WorkoutMenuViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class WorkoutMenuViewController: UIViewController, Storyboarded {
    
    var workoutMenuPresenter: WorkoutMenuPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet var workoutsTodayLabel: UILabel!
    @IBOutlet var workoutTimeLabel: UILabel!
    @IBOutlet var beginWorkoutButton: PSPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutMenuPresenter.getWorkoutInformation()
        
        beginWorkoutButton.addTarget(self, action: #selector(beginWorkoutButtonTapped), for: .touchUpInside)
    }
    
    @objc func beginWorkoutButtonTapped() {
        workoutMenuPresenter.startWorkout()
    }

}

extension WorkoutMenuViewController: WorkoutMenuPresenterView {
    func didGetWorkoutInformation(numberOfWorkoutsToday: Int, workoutTime: String) {
        workoutsTodayLabel.text = "\(numberOfWorkoutsToday)"
        workoutTimeLabel.text = workoutTime
    }
}
