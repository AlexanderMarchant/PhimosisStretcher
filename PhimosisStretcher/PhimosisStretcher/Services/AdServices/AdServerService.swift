//
//  AdServerService.swift
//  Kegal Timer
//
//  Created by Alex Marchant on 04/01/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class AdServerService {
    
    let areAdsDisabled: Bool!
    let notificationCenter = NotificationCenter.default
    
    var adMobService: AdMobService!
    
    init() {
        self.areAdsDisabled = UserDefaults.standard.bool(forKey: Constants.adsDisabled)
        
        if(!self.areAdsDisabled) {
            self.adMobService = AdMobService(delegate: self)
        }
    }
    
    func reloadAds() {
        if(!areAdsDisabled) {
            self.adMobService.loadAds()
        }
    }
    
    func displayInterstitialAd(viewController: UIViewController) {
        if(!areAdsDisabled) {
            let adDisplayed = adMobService.displayGADInterstitial(viewController)
        }
    }
    
    func setupAdMobBannerView(
        adId: String,
        viewController: UIViewController,
        bannerContainerView: UIView) -> GADBannerView? {
        if(!areAdsDisabled) {
            return adMobService.setupAdBannerView(adId, viewController, bannerContainerView)
        }
        
        return nil
    }
}

extension AdServerService: AdServiceDelegate {
    func didFailToLoadBanner(_ adService: AdService) {
        switch adService {
        case .adMob:
            self.notificationCenter.post(.didFailToLoadAdMobBanner())
        }
    }
    
    func didFailToLoadInterstitial(_ adService: AdService) {
        switch adService {
        case .adMob:
            self.notificationCenter.post(.didFailToLoadAdMobInterstitial())
        }
    }
    
    
}
