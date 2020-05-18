//
//  WorkoutCompletePresenterProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol WorkoutCompletePresenterProtocol: InformationScreenPresenterProtocol {
    func updateWorkoutsToday()
    func displayInterstitialAd(viewController: UIViewController)
}
