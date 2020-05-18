//
//  AdMobServiceProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds

protocol AdMobServiceProtocol {
    
    var delegate: AdServiceDelegate { get }
    
    var interstitial: GADInterstitial! { get }
    var bannerAdRequest: GADRequest! { get }
    var interstitialAdRequest: GADRequest! { get }
    
    var bannerContainerView: UIView! { get }
    
    init(delegate: AdServiceDelegate)
    
    func loadAds()
    
    func displayGADInterstitial() -> GADInterstitial?
    
    func setupAdBannerView(_ adUnitId: String, _ viewController: UIViewController, _ bannerContainerView: UIView) -> GADBannerView
}
