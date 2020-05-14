//
//  MockMFMailComposeViewControllerService.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import MessageUI
@testable import PhimosisStretcher

class MockMFMailComposeService: MFMailComposeViewController, MockObjectProtocol, MFMailComposeServiceProtocol {
    
    func resetCallCounts() {
    }
    
}
