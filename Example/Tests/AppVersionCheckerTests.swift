// AppVersionCheckerTests.swift
//
// Copyright (c) 2015 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
