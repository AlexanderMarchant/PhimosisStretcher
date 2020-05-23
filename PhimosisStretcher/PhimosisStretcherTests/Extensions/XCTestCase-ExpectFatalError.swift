//
//  XCTestCase-ExpectFatalError.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import XCTest

@testable import PhimosisStretcher

extension XCTestCase {
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
        
        // arrange
        let expectation = self.expectation(description: "expectingFatalError")
        var assertionMessage: String? = nil
        
        // override fatalError. This will pause forever when fatalError is called.
        FatalErrorUtility.replaceFatalError { message, _, _ in
            assertionMessage = message
            expectation.fulfill()
            unreachable()
        }
        
        // act, perform on separate thead because a call to fatalError pauses forever
        DispatchQueue.global(qos: .userInitiated).async(execute: testcase)
        
        waitForExpectations(timeout: 10) { _ in
            // Assert
            XCTAssertEqual(assertionMessage, expectedMessage)
            
            // clean up
            FatalErrorUtility.restoreFatalError()
        }
    }
}
