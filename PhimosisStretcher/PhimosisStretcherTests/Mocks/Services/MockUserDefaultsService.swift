//
//  MockUserDefaultsService.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockUserDefaultsService: UserDefaults, MockObjectProtocol, UserDefaultsServiceProtocol {
    
    var getBoolValueCallCount = 0
    var getBoolValueReturnValue: Bool!
    
    var getIntValueCallCount = 0
    var getIntValueReturnValue: Int!
    
    var setBoolValueCallCount = 0
    var setIntValueCallCount = 0
    var setIntValue: Int!
    var setAnyValueCallCount = 0
    
    var getStringValueCallCount = 0
    var getStringValueReturnValue: String!
    
    func resetCallCounts() {
        self.getBoolValueCallCount = 0
        self.getIntValueCallCount = 0
        self.setBoolValueCallCount = 0
        self.setIntValueCallCount = 0
        self.setAnyValueCallCount = 0
        self.getStringValueCallCount = 0
    }
    
    override func bool(forKey defaultName: String) -> Bool {
        getBoolValueCallCount += 1
        
        return getBoolValueReturnValue!
    }
    
    override func integer(forKey defaultName: String) -> Int {
        getIntValueCallCount += 1
        
        return getIntValueReturnValue!
    }
    
    override func set(_ value: Bool, forKey defaultName: String) {
        setBoolValueCallCount += 1
    }
    
    override func set(_ value: (Any)?, forKey defaultName: String) {
        setAnyValueCallCount += 1
    }
    
    override func set(_ value: Int, forKey defaultName: String) {
        setIntValueCallCount += 1
        setIntValue = value
    }
    
    override func string(forKey defaultName: String) -> String? {
        getStringValueCallCount += 1
        
        return getStringValueReturnValue ?? nil
    }
    
}
