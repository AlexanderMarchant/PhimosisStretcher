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
        
        beginWorkoutButton.addTarget(self, action: #selector(beginWorkoutButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        workoutMenuPresenter.getWorkoutInformation()
    }
    
    @objc func beginWorkoutButtonTapped() {
        workoutMenuPresenter.startWorkout()
    }

}

extension WorkoutMenuViewController: WorkoutMenuPresenterView {
    func didGetWorkoutInformation(_ numberOfWorkoutsToday: Int, _ targetWorkoutsPerDay: Int, _ workoutTime: String) {
        workoutsTodayLabel.text = "\(numberOfWorkoutsToday) / \(targetWorkoutsPerDay)"
        workoutTimeLabel.text = workoutTime
    }
}
