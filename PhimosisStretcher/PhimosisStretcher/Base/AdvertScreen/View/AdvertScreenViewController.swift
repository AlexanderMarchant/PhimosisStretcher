//
//  AdvertScreenViewController.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdvertScreenViewController: UIViewController {
    
    var advertScreenPresenter: AdvertScreenPresenterProtocol!
    var adBannerView: GADBannerView!
    
    @IBOutlet var bannerAdContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerAdContainerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        bannerAdContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerAdContainerView)
        
        self.view.addConstraints([
            NSLayoutConstraint(item: bannerAdContainerView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: bannerAdContainerView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: bannerAdContainerView!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 25),
            NSLayoutConstraint(item: bannerAdContainerView!, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1.0, constant: 25)
        ])
        
        advertScreenPresenter.getBannerAd(viewController: self, bannerContainerView: bannerAdContainerView)
    }
    
    func displayInterstitialAd() {
        advertScreenPresenter.getInterstitialAd(viewController: self)
    }
    
    func reloadAds() {
        advertScreenPresenter.reloadAds()
    }

}

extension AdvertScreenViewController: AdvertScreenPresenterView {
    func didGetBannerAd(ad: GADBannerView?) {
        self.adBannerView = ad
    }
    
    func didGetInterstitialAd(ad: GADInterstitial?) {
        if let ad = ad {
            ad.present(fromRootViewController: self.navigationController!)
        }
    }
}
