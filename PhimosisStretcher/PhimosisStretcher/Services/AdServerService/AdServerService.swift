//
//  AdServerService.swift
//  Phimosis Stretcher
//
//  Created by Alex Marchant on 04/01/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class AdServerService: AdServerServiceProtocol {
    
    var adsAreDisabled: Bool! = false
    let userDefaultsService: UserDefaultsServiceProtocol
    let notificationCenter = NotificationCenter.default
    
    var adMobService: AdMobService!
    
    init(_ userDefaultsService: UserDefaultsServiceProtocol) {
        self.userDefaultsService = userDefaultsService
        
        self.adsAreDisabled = userDefaultsService.bool(forKey: Constants.adsDisabled)
        
        if(!self.adsAreDisabled) {
            self.adMobService = AdMobService(delegate: self)
        }
    }
    
    func reloadAds() {
        if(!adsAreDisabled) {
            self.adMobService.loadAds()
        }
    }
    
    func getInterstitialAd() -> GADInterstitial? {
        if(!adsAreDisabled) {
            return adMobService.displayGADInterstitial()
        } else {
            return nil
        }
    }
    
    func setupAdMobBannerView(
        adId: String,
        viewController: UIViewController,
        bannerContainerView: UIView) -> GADBannerView? {
        if(!adsAreDisabled) {
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
