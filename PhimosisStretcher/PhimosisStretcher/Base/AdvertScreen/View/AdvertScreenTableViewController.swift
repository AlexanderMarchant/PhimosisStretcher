//
//  AdvertScreenTableViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds

class AdvertScreenTableViewController: UITableViewController {
    
    var advertScreenPresenter: AdvertScreenPresenterProtocol!
    var adBannerView: GADBannerView!
    
    @IBOutlet var bannerAdContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        
        advertScreenPresenter.getBannerAd(viewController: self, bannerContainerView: self.tableView!.tableHeaderView!)
    }
    
    func displayInterstitialAd() {
        advertScreenPresenter.getInterstitialAd(viewController: self)
    }
    
    func reloadAds() {
        advertScreenPresenter.reloadAds()
    }

}

extension AdvertScreenTableViewController: AdvertScreenPresenterView {
    func didGetBannerAd(ad: GADBannerView?) {
        self.adBannerView = ad
        
        adBannerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            adBannerView.centerXAnchor.constraint(equalTo: self.tableView!.tableHeaderView!.centerXAnchor),
        ])
    }
    
    func didGetInterstitialAd(ad: GADInterstitial?) {
        if let ad = ad {
            ad.present(fromRootViewController: self.navigationController!)
        }
        self.reloadAds()
    }
}
