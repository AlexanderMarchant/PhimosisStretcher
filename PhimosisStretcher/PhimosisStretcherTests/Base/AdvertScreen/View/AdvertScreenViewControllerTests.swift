//
//  AdvertScreenViewControllerTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
import GoogleMobileAds
@testable import PhimosisStretcher

class AdvertScreenViewControllerTests: XCTestCase {

    var advertScreenViewController: AdvertScreenViewController!
    var mockAdvertScreenPresenter: MockAdvertScreenPresenter!

    override func setUp(){
        mockAdvertScreenPresenter = MockAdvertScreenPresenter()
        
        advertScreenViewController = AdvertScreenViewController()
        
        advertScreenViewController.advertScreenPresenter = mockAdvertScreenPresenter
        
        advertScreenViewController.viewDidLoad()
        
        mockAdvertScreenPresenter.resetCallCounts()
    }

    override func tearDown() {
        advertScreenViewController = nil
        mockAdvertScreenPresenter = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        advertScreenViewController.viewDidLoad()
        
        // Assert
        XCTAssertNotNil(advertScreenViewController.bannerAdContainerView)
        XCTAssertFalse(advertScreenViewController.bannerAdContainerView.translatesAutoresizingMaskIntoConstraints)
        
        XCTAssertEqual(1, mockAdvertScreenPresenter.getBannerAdCallCount)
    }
    
    func testDisplayInterstitialAd() {
        // Arrange/Act
        advertScreenViewController.displayInterstitialAd()
        
        // Assert
        XCTAssertEqual(1, mockAdvertScreenPresenter.getInterstitialAdCallCount)
    }
    
    func testReloadAds() {
        // Arrange/Act
        advertScreenViewController.reloadAds()
        
        // Assert
        XCTAssertEqual(1, mockAdvertScreenPresenter.reloadAdsCallCount)
    }
    
    func testAdvertScreenPresenterView_DidGetBannerAd() {
        // Arrange
        let BANNER = GADBannerView()
        
        // Act
        advertScreenViewController.didGetBannerAd(ad: BANNER)
        
        // Assert
        XCTAssertEqual(BANNER, advertScreenViewController.adBannerView)
    }

}
