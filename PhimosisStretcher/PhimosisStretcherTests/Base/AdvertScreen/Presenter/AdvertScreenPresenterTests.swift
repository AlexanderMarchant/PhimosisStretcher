//
//  AdvertScreenPresenterTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
import UIKit
import GoogleMobileAds
@testable import PhimosisStretcher

class AdvertScreenPresenterTests: XCTestCase {

    var advertScreenPresenter: AdvertScreenPresenter!
    var mockAdServerService: MockAdServerService!
    var mockAdvertScreenPresenterView: MockAdvertScreenPresenterView!
    var mockAdvertScreenPresenterDelegate: MockAdvertScreenPresenterDelegate!

    override func setUp() {
        mockAdServerService = MockAdServerService()
        mockAdvertScreenPresenterView = MockAdvertScreenPresenterView()
        mockAdvertScreenPresenterDelegate = MockAdvertScreenPresenterDelegate()
        
        advertScreenPresenter = AdvertScreenPresenter(
            mockAdServerService,
            with: mockAdvertScreenPresenterView,
            delegate: mockAdvertScreenPresenterDelegate)
    }

    override func tearDown() {
        advertScreenPresenter = nil
        mockAdServerService = nil
        mockAdvertScreenPresenterView = nil
        mockAdvertScreenPresenterDelegate = nil
    }
    
    func testGetBannerAd() {
        // Arrange
        let vc = UIViewController()
        let view = UIView()
        
        // Act
        advertScreenPresenter.getBannerAd(viewController: vc, bannerContainerView: view)
        
        // Assert
        XCTAssertEqual(1, mockAdServerService.setupAdMobBannerViewCallCount)
        XCTAssertEqual(1, mockAdvertScreenPresenterView.didGetBannerAdCallCount)
    }
    
    func testGetInterstitialAd() {
        // Arrange
        let vc = UIViewController()
        
        // Act
        advertScreenPresenter.getInterstitialAd(viewController: vc)
        
        // Assert
        XCTAssertEqual(1, mockAdServerService.getInterstitialAdCallCount)
        XCTAssertEqual(1, mockAdvertScreenPresenterView.didGetInterstitialAdCallCount)
    }
    
    func testReloadAds() {
        // Arrange/Act
        advertScreenPresenter.reloadAds()
        
        // Assert
        XCTAssertEqual(1, mockAdServerService.reloadAdsCallCount)
    }

}
