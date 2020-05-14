//
//  WorkoutCompleteViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class WorkoutCompleteViewController: InformationScreenViewController {
    
    var workoutCompletePresenter: WorkoutCompletePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screenImage.image = UIImage(named: "workout-complete")!
        self.screenTitle.text = "Workout Complete!"
        self.screenDescription.text = "Nice work, that's another workout completed, you're now one step closer!"
        
        self.primaryButton.setTitle("Easy Work", for: .normal)
        self.secondaryButton.setTitle("High Five", for: .normal)
        self.secondaryButton.isHidden = true
        self.secondaryButton.isEnabled = false
    }
    
    override func primaryButtonTapped() {
        workoutCompletePresenter.didTapClose()
    }
    
    override func secondaryButtonTapped() {
        workoutCompletePresenter.didTapClose()
    }

}

extension WorkoutCompleteViewController: WorkoutCompletePresenterView {
    
}
