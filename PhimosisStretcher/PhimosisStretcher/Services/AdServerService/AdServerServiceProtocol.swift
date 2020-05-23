//
//  AdServerServiceProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

protocol AdServerServiceProtocol {
    
    var adsAreDisabled: Bool! { get set }
    
    var adMobService: AdMobService! { get }
    
    func reloadAds()
    
    func getInterstitialAd() -> GADInterstitial?
    
    func setupAdMobBannerView(adId: String, viewController: UIViewController, bannerContainerView: UIView) -> GADBannerView?
}
