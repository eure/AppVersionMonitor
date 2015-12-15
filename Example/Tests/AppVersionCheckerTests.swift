//
//  AppVersionCheckerTests.swift
//  AppVersionCheckerTests
//
//  Created by Hiroshi Kimura on 8/25/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import XCTest
@testable import AppVersionMonitor

class AppVersionCheckerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVersion() {
        XCTAssert(AppVersion("1.4.5") <= "1.5.5")
        XCTAssert(AppVersion("1.4.5") <= "1.55.0")
        XCTAssert(AppVersion("1.4.5") <= "1.555.0")
        XCTAssert(AppVersion("1.4.5") <= "1.4.5.4")
        XCTAssert(AppVersion("1.4.5") <= "1.4.5.3.4.6")
        XCTAssert(AppVersion("1.4.5") <= "2.0.0")
        
        XCTAssert((AppVersion("1.5.5") <= "1.4.5") == false)
        XCTAssert((AppVersion("1.55.0") <= "1.4.5") == false)
        XCTAssert((AppVersion("1.555.0") <= "1.4.5") == false)
        XCTAssert((AppVersion("1.4.5.4") <= "1.4.5") == false)
        XCTAssert((AppVersion("1.4.5.3.4.6.") <= "1.4.5") == false)
        XCTAssert((AppVersion("2.0.0") <= "1.4.5") == false)
        
        XCTAssert((AppVersion("1.4.5") >= "1.5.5") == false)
        XCTAssert((AppVersion("1.4.5") >= "1.55.0") == false)
        XCTAssert((AppVersion("1.4.5") >= "1.555.0") == false)
        XCTAssert((AppVersion("1.4.5") >= "1.4.5.4") == false)
        XCTAssert((AppVersion("1.4.5") >= "1.4.5.3.4.6") == false)
        XCTAssert((AppVersion("1.4.5") >= "2.0.0") == false)
        
        XCTAssert(AppVersion("2.0.0") == "2.0.0")
        XCTAssert(AppVersion("2.0.0") == "2.0.0.0")
        XCTAssert(AppVersion("2.0.0") == "2.00.00.0.0")
        
        XCTAssert((AppVersion("2.0.0") == "23.0.1") == false)
        XCTAssert((AppVersion("2.0.0") >= "23.0.1") == false)
        XCTAssert((AppVersion("2.0.0") <= "23.0.1") == true)
        
        XCTAssert((AppVersion("23.0.1") == "2.0.0") == false)
        XCTAssert((AppVersion("23.0.1") >= "2.0.0") == true)
        XCTAssert((AppVersion("23.0.1") <= "2.0.0") == false)
        
        
        XCTAssert((AppVersion("3.0.1") < "3.6.0") == true)
        XCTAssert((AppVersion("3.10.1") < "3.6.0") == false)
        XCTAssert((AppVersion("3.0.1") < "3.0.1") == false)
        
    }
}
