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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension WorkoutViewController: WorkoutPresenterView {
    
}
