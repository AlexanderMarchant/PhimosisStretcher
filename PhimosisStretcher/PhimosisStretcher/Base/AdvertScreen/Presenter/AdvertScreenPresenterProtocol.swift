//
//  AdvertScreenPresenterProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol AdvertScreenPresenterProtocol {
    func getBannerAd(viewController: UIViewController, bannerContainerView: UIView)
    func getInterstitialAd(viewController: UIViewController)
    func reloadAds()
}
