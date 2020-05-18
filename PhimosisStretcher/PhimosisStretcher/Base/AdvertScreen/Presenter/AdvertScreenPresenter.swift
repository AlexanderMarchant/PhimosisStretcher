//
//  AdvertScreenPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit

protocol AdvertScreenPresenterView {
    func didGetBannerAd(ad: GADBannerView?)
    func didGetInterstitialAd(ad: GADInterstitial?)
}

protocol AdvertScreenPresenterDelegate {
}

class AdvertScreenPresenter: AdvertScreenPresenterProtocol {
    
    let adServerService: AdServerServiceProtocol
    let view: AdvertScreenPresenterView
    let delegate: AdvertScreenPresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        with view: AdvertScreenPresenterView,
        delegate: AdvertScreenPresenterDelegate) {
        
        self.adServerService = adServerService
        self.view = view
        self.delegate = delegate
    }
    
    func getBannerAd(viewController: UIViewController, bannerContainerView: UIView) {
        let bannerView = adServerService.setupAdMobBannerView(
            adId: Constants.generalBannerAdId,
            viewController: viewController,
            bannerContainerView: bannerContainerView)
        
        self.view.didGetBannerAd(ad: bannerView)
    }
    
    func getInterstitialAd(viewController: UIViewController) {
        let ad = adServerService.getInterstitialAd()
        self.view.didGetInterstitialAd(ad: ad)
    }
    
    func reloadAds() {
        adServerService.reloadAds()
    }
    
}

