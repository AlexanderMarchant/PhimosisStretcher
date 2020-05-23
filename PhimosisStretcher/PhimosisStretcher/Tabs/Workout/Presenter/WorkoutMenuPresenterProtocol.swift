//
//  WorkoutMenuPresenterProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol WorkoutMenuPresenterProtocol: AdvertScreenPresenterProtocol {
    func getWorkoutInformation()
    func startWorkout()
    func displayInterstitialAd(viewController: UIViewController)
}
