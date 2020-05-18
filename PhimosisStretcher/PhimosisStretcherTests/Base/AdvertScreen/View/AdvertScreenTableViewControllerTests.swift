//
//  AdvertScreenTableViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest//
//  AdvertScreenTableViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 18/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
import GoogleMobileAds
@testable import PhimosisStretcher

class AdvertScreenTableViewControllerTests: XCTestCase {

    var advertScreenTableViewController: AdvertScreenTableViewController!
    var mockAdvertScreenPresenter: MockAdvertScreenPresenter!

    override func setUpWithError() throws {
        mockAdvertScreenPresenter = MockAdvertScreenPresenter()
        
        advertScreenTableViewController = AdvertScreenTableViewController()
        
        advertScreenTableViewController.advertScreenPresenter = mockAdvertScreenPresenter
        
        advertScreenTableViewController.viewDidLoad()
        
        mockAdvertScreenPresenter.resetCallCounts()
    }

    override func tearDownWithError() throws  {
        advertScreenTableViewController = nil
        mockAdvertScreenPresenter = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        advertScreenTableViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(50, advertScreenTableViewController.tableView.tableHeaderView?.frame.size.height)
        
        XCTAssertEqual(1, mockAdvertScreenPresenter.getBannerAdCallCount)
    }
    
    func testDisplayInterstitialAd() {
        // Arrange/Act
        advertScreenTableViewController.displayInterstitialAd()
        
        // Assert
        XCTAssertEqual(1, mockAdvertScreenPresenter.getInterstitialAdCallCount)
    }
    
    func testReloadAds() {
        // Arrange/Act
        advertScreenTableViewController.reloadAds()
        
        // Assert
        XCTAssertEqual(1, mockAdvertScreenPresenter.reloadAdsCallCount)
    }

}
